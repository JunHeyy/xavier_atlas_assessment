# app/graphql/types/input/item_input_type.rb
module Types
    module Input
      class ItemInputType < Types::BaseInputObject
        argument :identifier, String, required: true
        argument :label, String, required: true
        argument :description, String, required: false
        argument :price, Float, required: true
        argument :item_type, String, required: true
        argument :section_id, ID, required: true
      end
    end
  end
  