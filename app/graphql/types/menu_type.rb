# app/graphql/types/menu_type.rb
module Types
  class MenuType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :label, String, null: true
    field :state, String, null: true
    field :start_date, GraphQL::Types::ISO8601Date, null: true
    field :end_date, GraphQL::Types::ISO8601Date, null: true
    field :sections, [Types::SectionType], null: true
  end
end
