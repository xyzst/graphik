# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: graphik.proto

require 'google/protobuf'

require 'google/protobuf/struct_pb'
require 'google/protobuf/timestamp_pb'
require 'google/protobuf/any_pb'
require 'google/protobuf/empty_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "api.Ref" do
    optional :gtype, :string, 1
    optional :gid, :string, 2
  end
  add_message "api.RefConstructor" do
    optional :gtype, :string, 1
    optional :gid, :string, 2
  end
  add_message "api.Refs" do
    repeated :refs, :message, 1, "api.Ref"
  end
  add_message "api.Doc" do
    optional :ref, :message, 1, "api.Ref"
    optional :attributes, :message, 2, "google.protobuf.Struct"
  end
  add_message "api.DocConstructor" do
    optional :ref, :message, 1, "api.RefConstructor"
    optional :attributes, :message, 2, "google.protobuf.Struct"
  end
  add_message "api.DocConstructors" do
    repeated :docs, :message, 1, "api.DocConstructor"
  end
  add_message "api.Traversal" do
    optional :doc, :message, 1, "api.Doc"
    repeated :traversal_path, :message, 2, "api.Ref"
    optional :depth, :uint64, 3
    optional :hops, :uint64, 4
  end
  add_message "api.Traversals" do
    repeated :traversals, :message, 1, "api.Traversal"
  end
  add_message "api.Docs" do
    repeated :docs, :message, 1, "api.Doc"
    optional :seek_next, :string, 2
  end
  add_message "api.Connection" do
    optional :ref, :message, 1, "api.Ref"
    optional :attributes, :message, 2, "google.protobuf.Struct"
    optional :directed, :bool, 3
    optional :from, :message, 4, "api.Ref"
    optional :to, :message, 5, "api.Ref"
  end
  add_message "api.ConnectionConstructor" do
    optional :ref, :message, 1, "api.RefConstructor"
    optional :attributes, :message, 3, "google.protobuf.Struct"
    optional :directed, :bool, 4
    optional :from, :message, 5, "api.Ref"
    optional :to, :message, 6, "api.Ref"
  end
  add_message "api.SConnectFilter" do
    optional :filter, :message, 1, "api.Filter"
    optional :gtype, :string, 2
    optional :attributes, :message, 3, "google.protobuf.Struct"
    optional :directed, :bool, 4
    optional :from, :message, 5, "api.Ref"
  end
  add_message "api.ConnectionConstructors" do
    repeated :connections, :message, 1, "api.ConnectionConstructor"
  end
  add_message "api.Connections" do
    repeated :connections, :message, 1, "api.Connection"
    optional :seek_next, :string, 2
  end
  add_message "api.CFilter" do
    optional :doc_ref, :message, 1, "api.Ref"
    optional :gtype, :string, 2
    optional :expression, :string, 3
    optional :limit, :uint64, 4
    optional :sort, :string, 5
    optional :seek, :string, 6
    optional :reverse, :bool, 7
  end
  add_message "api.Filter" do
    optional :gtype, :string, 1
    optional :expression, :string, 2
    optional :limit, :uint64, 3
    optional :sort, :string, 4
    optional :seek, :string, 5
    optional :reverse, :bool, 6
    optional :index, :string, 7
  end
  add_message "api.AggFilter" do
    optional :filter, :message, 1, "api.Filter"
    optional :aggregate, :enum, 2, "api.Aggregate"
    optional :field, :string, 3
  end
  add_message "api.TraverseFilter" do
    optional :root, :message, 1, "api.Ref"
    optional :doc_expression, :string, 2
    optional :connection_expression, :string, 3
    optional :limit, :uint64, 4
    optional :sort, :string, 5
    optional :reverse, :bool, 6
    optional :algorithm, :enum, 7, "api.Algorithm"
    optional :max_depth, :uint64, 8
    optional :max_hops, :uint64, 9
  end
  add_message "api.TraverseMeFilter" do
    optional :doc_expression, :string, 1
    optional :connection_expression, :string, 2
    optional :limit, :uint64, 3
    optional :sort, :string, 4
    optional :reverse, :bool, 5
    optional :algorithm, :enum, 6, "api.Algorithm"
    optional :max_depth, :uint64, 7
    optional :max_hops, :uint64, 8
  end
  add_message "api.IndexConstructor" do
    optional :name, :string, 1
    optional :gtype, :string, 3
    optional :expression, :string, 4
    optional :docs, :bool, 6
    optional :connections, :bool, 7
  end
  add_message "api.Authorizer" do
    optional :name, :string, 1
    optional :expression, :string, 2
  end
  add_message "api.Authorizers" do
    repeated :authorizers, :message, 1, "api.Authorizer"
  end
  add_message "api.TypeValidator" do
    optional :name, :string, 1
    optional :gtype, :string, 2
    optional :expression, :string, 3
    optional :docs, :bool, 4
    optional :connections, :bool, 5
  end
  add_message "api.TypeValidators" do
    repeated :validators, :message, 1, "api.TypeValidator"
  end
  add_message "api.Index" do
    optional :name, :string, 1
    optional :gtype, :string, 3
    optional :expression, :string, 4
    optional :docs, :bool, 6
    optional :connections, :bool, 7
  end
  add_message "api.Indexes" do
    repeated :indexes, :message, 1, "api.Index"
  end
  add_message "api.ChanFilter" do
    optional :channel, :string, 1
    optional :expression, :string, 2
  end
  add_message "api.Graph" do
    optional :docs, :message, 1, "api.Docs"
    optional :connections, :message, 2, "api.Connections"
  end
  add_message "api.Flags" do
    optional :open_id_discovery, :string, 1
    optional :storage_path, :string, 2
    optional :metrics, :bool, 3
    repeated :allow_headers, :string, 5
    repeated :allow_methods, :string, 6
    repeated :allow_origins, :string, 7
    repeated :root_users, :string, 8
    optional :tls_cert, :string, 9
    optional :tls_key, :string, 10
    optional :playground_client_id, :string, 11
    optional :playground_client_secret, :string, 12
    optional :playground_redirect, :string, 13
  end
  add_message "api.Boolean" do
    optional :value, :bool, 1
  end
  add_message "api.Number" do
    optional :value, :double, 1
  end
  add_message "api.ExistsFilter" do
    optional :gtype, :string, 1
    optional :expression, :string, 2
    optional :seek, :string, 3
    optional :reverse, :bool, 4
    optional :index, :string, 5
  end
  add_message "api.Edit" do
    optional :ref, :message, 1, "api.Ref"
    optional :attributes, :message, 2, "google.protobuf.Struct"
  end
  add_message "api.EFilter" do
    optional :filter, :message, 1, "api.Filter"
    optional :attributes, :message, 2, "google.protobuf.Struct"
  end
  add_message "api.Pong" do
    optional :message, :string, 1
  end
  add_message "api.OutboundMessage" do
    optional :channel, :string, 1
    optional :data, :message, 2, "google.protobuf.Struct"
  end
  add_message "api.Message" do
    optional :channel, :string, 1
    optional :data, :message, 2, "google.protobuf.Struct"
    optional :sender, :message, 3, "api.Ref"
    optional :timestamp, :message, 4, "google.protobuf.Timestamp"
  end
  add_message "api.Schema" do
    repeated :connection_types, :string, 1
    repeated :doc_types, :string, 2
    optional :authorizers, :message, 3, "api.Authorizers"
    optional :validators, :message, 4, "api.TypeValidators"
    optional :indexes, :message, 5, "api.Indexes"
  end
  add_message "api.ExprFilter" do
    optional :expression, :string, 1
  end
  add_message "api.Request" do
    optional :method, :string, 1
    optional :user, :message, 2, "api.Doc"
    optional :timestamp, :message, 3, "google.protobuf.Timestamp"
    optional :request, :message, 4, "google.protobuf.Struct"
  end
  add_enum "api.Algorithm" do
    value :BFS, 0
    value :DFS, 1
  end
  add_enum "api.Aggregate" do
    value :COUNT, 0
    value :SUM, 1
    value :AVG, 2
    value :MAX, 3
    value :MIN, 4
    value :PROD, 5
  end
end

module Api
  Ref = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Ref").msgclass
  RefConstructor = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.RefConstructor").msgclass
  Refs = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Refs").msgclass
  Doc = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Doc").msgclass
  DocConstructor = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.DocConstructor").msgclass
  DocConstructors = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.DocConstructors").msgclass
  Traversal = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Traversal").msgclass
  Traversals = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Traversals").msgclass
  Docs = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Docs").msgclass
  Connection = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Connection").msgclass
  ConnectionConstructor = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.ConnectionConstructor").msgclass
  SConnectFilter = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.SConnectFilter").msgclass
  ConnectionConstructors = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.ConnectionConstructors").msgclass
  Connections = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Connections").msgclass
  CFilter = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.CFilter").msgclass
  Filter = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Filter").msgclass
  AggFilter = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.AggFilter").msgclass
  TraverseFilter = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.TraverseFilter").msgclass
  TraverseMeFilter = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.TraverseMeFilter").msgclass
  IndexConstructor = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.IndexConstructor").msgclass
  Authorizer = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Authorizer").msgclass
  Authorizers = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Authorizers").msgclass
  TypeValidator = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.TypeValidator").msgclass
  TypeValidators = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.TypeValidators").msgclass
  Index = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Index").msgclass
  Indexes = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Indexes").msgclass
  ChanFilter = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.ChanFilter").msgclass
  Graph = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Graph").msgclass
  Flags = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Flags").msgclass
  Boolean = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Boolean").msgclass
  Number = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Number").msgclass
  ExistsFilter = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.ExistsFilter").msgclass
  Edit = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Edit").msgclass
  EFilter = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.EFilter").msgclass
  Pong = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Pong").msgclass
  OutboundMessage = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.OutboundMessage").msgclass
  Message = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Message").msgclass
  Schema = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Schema").msgclass
  ExprFilter = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.ExprFilter").msgclass
  Request = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Request").msgclass
  Algorithm = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Algorithm").enummodule
  Aggregate = Google::Protobuf::DescriptorPool.generated_pool.lookup("api.Aggregate").enummodule
end
