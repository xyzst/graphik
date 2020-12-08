package gql

import (
	apipb "github.com/autom8ter/graphik/gen/go"
	"github.com/autom8ter/graphik/gen/gql/model"
)

func protoIRef(path *model.RefInput) *apipb.Ref {
	return &apipb.Ref{
		Gtype: path.Gtype,
		Gid:   path.Gid,
	}
}

func protoRef(path *model.Ref) *apipb.Ref {
	return &apipb.Ref{
		Gtype: path.Gtype,
		Gid:   path.Gid,
	}
}

func protoRefC(path *model.RefConstructor) *apipb.RefConstructor {
	p := &apipb.RefConstructor{
		Gtype: path.Gtype,
	}
	if path.Gid != nil {
		p.Gid = *path.Gid
	}
	return p
}

func protoDoc(d *model.Doc) *apipb.Doc {
	return &apipb.Doc{
		Ref:        protoRef(d.Ref),
		Attributes: apipb.NewStruct(d.Attributes),
	}
}

func protoDocC(d *model.DocConstructor) *apipb.DocConstructor {
	return &apipb.DocConstructor{
		Ref:        protoRefC(d.Ref),
		Attributes: apipb.NewStruct(d.Attributes),
	}
}

func protoEdit(e *model.Edit) *apipb.Edit {
	return &apipb.Edit{
		Ref:        protoIRef(e.Ref),
		Attributes: apipb.NewStruct(e.Attributes),
	}
}

func protoConnection(d *model.Connection) *apipb.Connection {
	return &apipb.Connection{
		Ref:        protoRef(d.Ref),
		Attributes: apipb.NewStruct(d.Attributes),
		From:       protoRef(d.From),
		To:         protoRef(d.To),
		Directed:   d.Directed,
	}
}

func protoConnectionC(d *model.ConnectionConstructor) *apipb.ConnectionConstructor {
	return &apipb.ConnectionConstructor{
		Ref:        protoRefC(d.Ref),
		Attributes: apipb.NewStruct(d.Attributes),
		From:       protoIRef(d.From),
		To:         protoIRef(d.To),
		Directed:   d.Directed,
	}
}

func protoFilter(filter *model.Filter) *apipb.Filter {
	f := &apipb.Filter{
		Gtype: filter.Gtype,
		Limit: uint64(filter.Limit),
	}
	if filter.Expression != nil {
		f.Expression = *filter.Expression
	}
	if filter.Sort != nil {
		f.Sort = *filter.Sort
	}
	if filter.Index != nil {
		f.Index = *filter.Index
	}
	if filter.Seek != nil {
		f.Seek = *filter.Seek
	}
	if filter.Reverse != nil {
		f.Reverse = *filter.Reverse
	}
	return f
}

func protoEFilter(filter *model.EFilter) *apipb.EFilter {
	return &apipb.EFilter{
		Filter:     protoFilter(filter.Filter),
		Attributes: apipb.NewStruct(filter.Attributes),
	}
}

func gqlRef(p *apipb.Ref) *model.Ref {
	return &model.Ref{
		Gtype: p.GetGtype(),
		Gid:   p.GetGid(),
	}
}

func gqlDoc(d *apipb.Doc) *model.Doc {
	return &model.Doc{
		Ref:        gqlRef(d.GetRef()),
		Attributes: d.GetAttributes().AsMap(),
	}
}

func gqlDocs(d *apipb.Docs) *model.Docs {
	var docs []*model.Doc
	for _, doc := range d.GetDocs() {
		docs = append(docs, gqlDoc(doc))
	}
	return &model.Docs{
		Docs:     docs,
		SeekNext: d.GetSeekNext(),
	}
}

func gqlTraversal(d *apipb.Traversal) *model.Traversal {
	t := &model.Traversal{
		Doc:   gqlDoc(d.GetDoc()),
		Depth: int(d.GetDepth()),
		Hops:  int(d.GetHops()),
	}
	for _, ref := range d.GetTraversalPath() {
		t.TraversalPath = append(t.TraversalPath, gqlRef(ref))
	}
	return t
}

func gqlTraversals(d *apipb.Traversals) *model.Traversals {
	var traversals []*model.Traversal
	for _, t := range d.GetTraversals() {
		traversals = append(traversals, gqlTraversal(t))
	}
	return &model.Traversals{
		Traversals: traversals,
	}
}

func gqlConnection(d *apipb.Connection) *model.Connection {
	return &model.Connection{
		Ref:        gqlRef(d.GetRef()),
		Attributes: d.GetAttributes().AsMap(),
		From:       gqlRef(d.GetFrom()),
		To:         gqlRef(d.GetTo()),
		Directed:   d.GetDirected(),
	}
}

func gqlConnections(d *apipb.Connections) *model.Connections {
	var conns []*model.Connection
	for _, c := range d.GetConnections() {
		conns = append(conns, gqlConnection(c))
	}
	return &model.Connections{
		Connections: conns,
		SeekNext:    d.GetSeekNext(),
	}
}

func gqlAuthorizer(val *apipb.Authorizer) *model.Authorizer {
	return &model.Authorizer{
		Name:       val.GetName(),
		Expression: val.GetExpression(),
	}
}

func gqlTypeValidator(val *apipb.TypeValidator) *model.TypeValidator {
	return &model.TypeValidator{
		Name:       val.GetName(),
		Expression: val.GetExpression(),
	}
}

func gqlIndex(val *apipb.Index) *model.Index {
	return &model.Index{
		Name:        val.GetName(),
		Gtype:       val.GetGtype(),
		Expression:  val.GetExpression(),
		Connections: &val.Connections,
		Docs:        &val.Docs,
	}
}

func gqlIndexes(val *apipb.Indexes) *model.Indexes {
	var vals []*model.Index
	for _, v := range val.GetIndexes() {
		vals = append(vals, gqlIndex(v))
	}
	return &model.Indexes{Indexes: vals}
}

func gqlAuthorizers(val *apipb.Authorizers) *model.Authorizers {
	var vals []*model.Authorizer
	for _, v := range val.GetAuthorizers() {
		vals = append(vals, gqlAuthorizer(v))
	}
	return &model.Authorizers{Authorizers: vals}
}

func gqlTypeValidators(val *apipb.TypeValidators) *model.TypeValidators {
	var vals []*model.TypeValidator
	for _, v := range val.GetValidators() {
		vals = append(vals, gqlTypeValidator(v))
	}
	return &model.TypeValidators{Validators: vals}
}

func gqlSchema(s *apipb.Schema) *model.Schema {
	return &model.Schema{
		ConnectionTypes: s.GetConnectionTypes(),
		DocTypes:        s.GetDocTypes(),
		Authorizers:     gqlAuthorizers(s.GetAuthorizers()),
		Validators:      gqlTypeValidators(s.GetValidators()),
		Indexes:         gqlIndexes(s.GetIndexes()),
	}
}

func protoAggFilter(filter *model.AggFilter) *apipb.AggFilter {
	f := &apipb.AggFilter{
		Filter:    protoFilter(filter.Filter),
		Aggregate: filter.Aggregate,
	}
	if filter.Field != nil {
		f.Field = *filter.Field
	}
	return f
}

func protoChanFilter(filter *model.ChanFilter) *apipb.ChanFilter {
	c := &apipb.ChanFilter{
		Channel: filter.Channel,
	}
	if filter.Expression != nil {
		c.Expression = *filter.Expression
	}
	return c
}

func protoAlgorithm(algorithm model.Algorithm) apipb.Algorithm {
	switch algorithm {
	case model.AlgorithmDfs:
		return apipb.Algorithm_DFS
	}
	return apipb.Algorithm_BFS
}

func gqlAlgorithm(algorithm apipb.Algorithm) model.Algorithm {
	switch algorithm {
	case apipb.Algorithm_DFS:
		return model.AlgorithmDfs
	}
	return model.AlgorithmBfs
}

func protoDepthFilter(filter *model.TFilter) *apipb.TFilter {
	c := &apipb.TFilter{
		Root:     protoIRef(filter.Root),
		Limit:    uint64(filter.Limit),
		MaxDepth: uint64(filter.MaxDepth),
		MaxHops:  uint64(filter.MaxHops),
	}
	if filter.Algorithm != nil {
		c.Algorithm = protoAlgorithm(*filter.Algorithm)
	}
	if filter.DocExpression != nil {
		c.DocExpression = *filter.DocExpression
	}
	if filter.ConnectionExpression != nil {
		c.ConnectionExpression = *filter.ConnectionExpression
	}
	if filter.Sort != nil {
		c.Sort = *filter.Sort
	}
	if filter.Reverse != nil {
		c.Reverse = *filter.Reverse
	}
	return c
}

func protoConnectionFilter(filter *model.CFilter) *apipb.CFilter {
	f := &apipb.CFilter{
		DocRef:     protoIRef(filter.DocRef),
		Gtype:      filter.Gtype,
		Expression: "",
		Limit:      uint64(filter.Limit),
		Sort:       "",
		Seek:       "",
		Reverse:    false,
	}
	if filter.Expression != nil {
		f.Expression = *filter.Expression
	}
	if filter.Sort != nil {
		f.Sort = *filter.Sort
	}
	if filter.Seek != nil {
		f.Seek = *filter.Seek
	}
	if filter.Reverse != nil {
		f.Reverse = *filter.Reverse
	}
	return f
}

func protoExpressionFilter(filter *model.ExprFilter) *apipb.ExprFilter {
	exp := &apipb.ExprFilter{}
	if filter.Expression != nil {
		exp.Expression = *filter.Expression
	}
	return exp
}

func gqlRefs(ps *apipb.Refs) *model.Refs {
	var paths []*model.Ref
	for _, p := range ps.GetRefs() {
		paths = append(paths, gqlRef(p))
	}
	return &model.Refs{Refs: paths}
}

func protoIndex(index *model.IndexInput) *apipb.Index {
	i := &apipb.Index{
		Name:       index.Name,
		Gtype:      index.Gtype,
		Expression: index.Expression,
	}
	if index.Docs != nil {
		i.Docs = *index.Docs
	}
	if index.Connections != nil {
		i.Connections = *index.Connections
	}
	return i
}

func protoAuthorizer(auth *model.AuthorizerInput) *apipb.Authorizer {
	return &apipb.Authorizer{
		Name:       auth.Name,
		Expression: auth.Expression,
	}
}

func protoTypeValidator(validator *model.TypeValidatorInput) *apipb.TypeValidator {
	return &apipb.TypeValidator{
		Name:       validator.Name,
		Expression: validator.Expression,
	}
}
