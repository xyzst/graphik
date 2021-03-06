package vm

import (
	"github.com/google/cel-go/cel"
	"github.com/google/cel-go/checker/decls"
	"github.com/graphikDB/graphik/gen/grpc/go"
	"github.com/pkg/errors"
	"strings"
)

type MessageVM struct {
	e *cel.Env
}

func NewMessageVM() (*MessageVM, error) {
	e, err := cel.NewEnv(
		cel.Types(&apipb.Ref{}, &apipb.Message{}),
		cel.Declarations(
			decls.NewVar("this", decls.NewMapType(decls.String, decls.Any)),
		),
	)
	if err != nil {
		return nil, err
	}
	return &MessageVM{e: e}, nil
}

func (n *MessageVM) Program(expression string) (cel.Program, error) {
	if expression == "" {
		return nil, errors.New("empty message expression")
	}
	ast, iss := n.e.Compile(expression)
	if err := iss.Err(); err != nil {
		return nil, errors.Wrapf(err, "failed to compile expression: %s", expression)
	}
	return n.e.Program(ast)
}

func (n *MessageVM) Programs(expressions []string) ([]cel.Program, error) {
	var programs []cel.Program
	for _, exp := range expressions {
		prgm, err := n.Program(exp)
		if err != nil {
			return nil, errors.Wrapf(err, "failed to compile expression: %v", expressions)
		}
		programs = append(programs, prgm)
	}
	return programs, nil
}

func (n *MessageVM) Eval(message *apipb.Message, programs ...cel.Program) (bool, error) {
	if len(programs) == 0 || programs[0] == nil {
		return true, nil
	}
	var passes = true
	for _, program := range programs {
		out, _, err := program.Eval(map[string]interface{}{
			"this": message.AsMap(),
		})
		if err != nil {
			if strings.Contains(err.Error(), "no such key") {
				return false, nil
			}
			return false, errors.Wrap(err, "failed to evaluate message")
		}
		if val, ok := out.Value().(bool); !ok || !val {
			passes = false
		}
	}
	return passes, nil
}
