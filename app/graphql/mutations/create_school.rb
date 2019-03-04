module Mutations
  class CreateSchool < Mutations::BaseObject
    graphql_name 'CreateSchoolMutation'
    description 'Create school mutation'

    argument :school, Types::SchoolInputType, required: true

    field :school, Types::SchoolType, null: true
    field :errors, [String], null: false

    def resolve(school:)
      new_school = School.new(school.to_h)

      if new_school.save
        {
          school: new_school,
          errors: []
        }
      else
        {
          school: new_school,
          errors: errors_for_record(new_school)
        }
      end
    end
  end
end
