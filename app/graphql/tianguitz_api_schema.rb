# frozen_string_literal: true

class TianguitzApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # For batch-loading (see https://graphql-ruby.org/dataloader/overview.html)
  use GraphQL::Dataloader

  # GraphQL-Ruby calls this when something goes wrong while running a query:

  # Union and Interface Resolution
  def self.resolve_type(abstract_type, obj, ctx)
    # TODO: Implement this method
    # to return the correct GraphQL object type for `obj`
    raise(GraphQL::RequiredImplementationMissingError)
  end

  # Relay-style Object Identification:

  # Return a string UUID for `object`
  def self.id_from_object(object, type_definition, query_ctx)
    # For example, use Rails' GlobalID library (https://github.com/rails/globalid):
    object.to_gid_param
  end

  # Given a string UUID, find the object
  def self.object_from_id(global_id, query_ctx)
    # For example, use Rails' GlobalID library (https://github.com/rails/globalid):
    GlobalID.find(global_id)
  end

  rescue_from ActiveRecord::RecordInvalid do |error|
    raise GraphQL::ExecutionError.new(error.record.errors.full_messages.join("\n"))
  end
  rescue_from ActiveRecord::RecordNotUnique do |error|
    raise GraphQL::ExecutionError.new(error.record.errors.full_messages.join("\n"))
  end
  rescue_from ActiveRecord::RecordNotFound do |error|
    raise GraphQL::ExecutionError.new(I18n.t('errors.messages.not_found', resource_name: error.model))
  end
end
