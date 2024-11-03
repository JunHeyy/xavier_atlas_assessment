# app/graphql/types/mutation_type.rb
module Types
  class MutationType < Types::BaseObject
    field :create_menu, Types::MenuType, null: false do
      argument :input, Types::Input::MenuInputType, required: true
    end

    def create_menu(input:)
      Menu.create!(input.to_h)
    end

    field :create_section, Types::SectionType, null: false do
      argument :input, Types::Input::SectionInputType, required: true
    end

    def create_section(input:)
      Section.create!(input.to_h)
    end

    field :create_item, Types::ItemType, null: false do
      argument :input, Types::Input::ItemInputType, required: true
    end

    def create_item(input:)
      Item.create!(input.to_h)
    end

    field :create_modifier_group, Types::ModifierGroupType, null: false do
      argument :input, Types::Input::ModifierGroupInputType, required: true
    end

    def create_modifier_group(input:)
      ModifierGroup.create!(input.to_h)
    end

    field :create_modifier, Types::ModifierType, null: false do
      argument :input, Types::Input::ModifierInputType, required: true
    end

    def create_modifier(input:)
      Modifier.create!(input.to_h)
    end

    # Add update methods similarly if needed.
  end
end
