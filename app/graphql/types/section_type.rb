# app/graphql/types/section_type.rb
module Types
  class SectionType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :description, String, null: true
    field :items, [Types::ItemType], null: true
  end
end
