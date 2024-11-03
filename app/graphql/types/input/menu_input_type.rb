# app/graphql/types/input/menu_input_type.rb
module Types
  module Input
    class MenuInputType < Types::BaseInputObject
      argument :identifier, String, required: true
      argument :label, String, required: true
      argument :state, String, required: true
      argument :start_date, GraphQL::Types::ISO8601Date, required: true
      argument :end_date, GraphQL::Types::ISO8601Date, required: true
    end
  end
end
