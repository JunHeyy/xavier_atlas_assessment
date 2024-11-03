# Checkpoint query
# app/graphql/types/query_type.rb
module Types
  class QueryType < Types::BaseObject
    # Query to get a single menu by identifier
    field :menu, Types::MenuType, null: true do
      argument :identifier, String, required: true
    end
    
    # Query to get all menus
    field :menus, [Types::MenuType], null: true

    def menu(identifier:)
      Menu.find_by(identifier: identifier)
    end

    def menus
      Menu.all
    end

    # Query to get a single section by identifier
    field :section, Types::SectionType, null: true do
      argument :identifier, String, required: true
    end

    def section(identifier:)
      Section.find_by(identifier: identifier)
    end

    # Query to get all sections
    field :sections, [Types::SectionType], null: true
    def sections
      Section.all
    end

    # Query to get filtered sections by identifiers
    field :sections_by_identifiers, [Types::SectionType], null: true do
      argument :identifiers, [String], required: true
    end

    def sections_by_identifiers(identifiers:)
      Section.where(identifier: identifiers)
    end

    # Query to get all items
    field :items, [Types::ItemType], null: true
    def items
      Item.all
    end

    # Query to get all modifier groups
    field :modifier_groups, [Types::ModifierGroupType], null: true
    def modifier_groups
      ModifierGroup.all
    end

    # Query to get all modifiers
    field :modifiers, [Types::ModifierType], null: true
    def modifiers
      Modifier.all
    end
  end
end