module Mutations
  class CreateSchool < Mutations::BaseObject
    description 'Fields required to create a school'

    argument :name, String, required: true

    def resolve(name:)
      School.create!(name: name)
    end
  end
end
