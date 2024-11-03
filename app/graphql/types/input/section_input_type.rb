# app/graphql/types/input/section_input_type.rb
module Types
    module Input
      class SectionInputType < Types::BaseInputObject
        argument :identifier, String, required: true
        argument :label, String, required: true
        argument :description, String, required: false
        argument :menu_id, ID, required: true
      end
    end
  end
  