# app/graphql/types/input/modifier_input_type.rb
module Types
    module Input
      class ModifierInputType < Types::BaseInputObject
        argument :label, String, required: true
        argument :default_quantity, Integer, required: true
        argument :price_override, Float, required: false
        argument :modifier_group_id, ID, required: true
      end
    end
  end
  