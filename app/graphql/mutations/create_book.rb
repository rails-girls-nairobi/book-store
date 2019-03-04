module Mutations
  class CreateBook < Mutations::BaseObject
    graphql_name 'CreateBook'
    description 'Create book mutation'

    argument :book, Types::BookInputType, required: true

    field :book, Types::BookType, null: false
    field :errors, [String], null: false

    def resolve(book:)
      new_book = Book.new(book.to_h)

      if new_book.save
        Rails.logger.warn("Saving new_book: #{new_book.inspect}")
        {
          book: new_book,
          errors: []
        }
      else
        {
          book: new_book,
          errors: errors_for_record(new_book)
        }
      end
    end
  end
end
