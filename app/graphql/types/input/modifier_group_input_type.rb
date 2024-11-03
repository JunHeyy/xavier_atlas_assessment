# app/graphql/types/input/modifier_group_input_type.rb
module Types
    module Input
      class ModifierGroupInputType < Types::BaseInputObject
        argument :identifier, String, required: true
        argument :label, String, required: true
        argument :selection_required_min, Integer, required: true
        argument :selection_required_max, Integer, required: true
      end
    end
  end
  