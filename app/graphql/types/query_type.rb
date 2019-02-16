module Types
  class QueryType < Types::BaseObject
    field :book, Types::BookType, null: false,
                                  description: 'Retrieve a book by id' do
      argument :id, ID, required: true
    end

    def book(id:)
      Book.where(id: id).first
    end

    field :school, Types::SchoolType, null: false,
                                      description: 'Get school by name' do
      argument :name, String, required: true
    end

    def school(name:)
      School.where(name: name).first
    end

    field :books, [Types::BookType], null: true, description: 'All books' do
      argument :limit, Int, required: false
    end

    def books(limit: 4)
      Book.all.order(latest).limit(limit)
    end

    private

    def latest
      'id desc'
    end
  end
end
