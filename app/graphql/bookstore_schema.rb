class BookstoreSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  def self.resolve_type(type, obj, ctx)
    "Types::#{obj.class}Type".constantize
  end

  def self.object_from_id(id, query_ctx)
    begin
      node = GlobalID::Locator.locate(EncryptedEncoder.decode(id))
    rescue ArgumentError
    end

    raise ActiveRecord::RecordNotFound unless node
    node
  end

  def self.id_from_object(object, type_definition, query_ctx)
    EncryptedEncoder.encode(object.to_global_id.to_s)
  end

  rescue_from ActiveRecord::RecordNotFound do |_|
    GraphQL::ExecutionError.new('Record not found')
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    GraphQL::ExecutionError.new(exception.record.errors.full_messages.join(', '))
  end

  rescue_from ActiveRecord::RecordNotUnique do |exception|
    GraphQL::ExecutionError.new(exception.message)
  end

  rescue_from StandardError do |exception|
    Rails.logger.error(exception.class)
    Rails.logger.error(exception.message)
    Rails.logger.error(exception.backtrace.join("\n"))
    GraphQL::ExecutionError.new('Please try to execute the query for this field later')
  end
end

# BookstoreSchema.graphql_definition
