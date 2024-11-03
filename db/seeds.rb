# Clear existing data to avoid duplication in the correct order
MenuSection.delete_all  
Menu.delete_all
Section.delete_all
Item.delete_all
ModifierGroup.delete_all
Modifier.delete_all
ItemModifierGroup.delete_all
SectionItem.delete_all

# Create Two Menus
non_config_menu = Menu.create!(
 identifier: "non_config_menu",
 label: "Chef's Signature Menu",
 state: "active",
 start_date: Date.today,
 end_date: Date.today + 30.days
)

config_menu = Menu.create!(
 identifier: "config_menu",
 label: "Build Your Own Menu",
 state: "active",
 start_date: Date.today,
 end_date: Date.today + 30.days
)

# Create sections for non-configurable menu
appetizer_section = Section.create!(
 identifier: "non_config_appetizers",
 label: "Appetizers",
 description: "Start your meal with our chef's signature appetizers"
)

main_course_section = Section.create!(
 identifier: "non_config_main_courses",
 label: "Main Courses",
 description: "Chef's specially curated main dishes"
)

# Create sections for configurable menu
custom_section = Section.create!(
 identifier: "config_custom_items",
 label: "Create Your Own",
 description: "Customize these dishes to your liking"
)

# Associate Sections with the Menus through MenuSection
MenuSection.create!(menu: non_config_menu, section: appetizer_section, display_order: 1)
MenuSection.create!(menu: non_config_menu, section: main_course_section, display_order: 2)
MenuSection.create!(menu: config_menu, section: custom_section, display_order: 1)

# Create Items for non-configurable sections (no modifier groups)
fries = Item.create!(
 identifier: 'non_config_fries',
 label: 'Truffle Fries',
 description: 'Hand-cut potatoes tossed in truffle oil, served with our signature aioli',
 price: 5.99,
 item_type: 0  # product
)

salad = Item.create!(
 identifier: 'non_config_salad',
 label: 'Mediterranean Salad',
 description: 'Fresh mixed greens with feta cheese, olives, and house-made vinaigrette',
 price: 7.99,
 item_type: 0  # product
)

# Create Items for configurable section
burger = Item.create!(
 identifier: 'config_burger',
 label: 'Build Your Own Burger',
 description: 'Start with our premium beef patty and add your favorite toppings',
 price: 12.99,
 item_type: 0  # product
)

pizza = Item.create!(
 identifier: 'config_pizza',
 label: 'Create Your Own Pizza',
 description: 'Personalize your 12" pizza with your choice of toppings',
 price: 15.99,
 item_type: 0  # product
)

# Create Component Items
sauce_component = Item.create!(
 identifier: 'config_comp_sauce',
 label: 'Truffle Aioli',
 description: 'House-made garlic aioli infused with black truffle',
 price: 0.75,
 item_type: 1  # component
)

cheese_component = Item.create!(
 identifier: 'config_comp_cheese',
 label: 'Mediterranean Feta',
 description: 'Imported Greek feta cheese',
 price: 1.50,
 item_type: 1  # component
)

# Create Modifier Groups only for configurable items
ActiveRecord::Base.transaction do
 # Create modifier groups for configurable items
 burger_toppings_group = ModifierGroup.new(
   identifier: "config_burger_toppings",
   label: "Burger Toppings",
   selection_required_min: 1,
   selection_required_max: 2
 )
 burger_toppings_group.save(validate: false)

 pizza_toppings_group = ModifierGroup.new(
   identifier: "config_pizza_toppings",
   label: "Pizza Toppings",
   selection_required_min: 1,
   selection_required_max: 3
 )
 pizza_toppings_group.save(validate: false)

 # Create Modifiers for configurable items
 Modifier.create!(
   item: sauce_component,
   modifier_group: burger_toppings_group,
   display_order: 1,
   default_quantity: 0,
   price_override: 0.75
 )

 Modifier.create!(
   item: cheese_component,
   modifier_group: burger_toppings_group,
   display_order: 2,
   default_quantity: 0,
   price_override: 1.50
 )

 Modifier.create!(
   item: sauce_component,
   modifier_group: pizza_toppings_group,
   display_order: 1,
   default_quantity: 0,
   price_override: 0.75
 )

 Modifier.create!(
   item: cheese_component,
   modifier_group: pizza_toppings_group,
   display_order: 2,
   default_quantity: 0,
   price_override: 1.50
 )

 # Validate modifier groups
 [burger_toppings_group, pizza_toppings_group].each do |mg|
   unless mg.valid?
     raise ActiveRecord::RecordInvalid.new(mg)
   end
 end

 # Associate only configurable items with modifier groups
 ItemModifierGroup.create!(item: burger, modifier_group: burger_toppings_group)
 ItemModifierGroup.create!(item: pizza, modifier_group: pizza_toppings_group)
end

# Associate Items with Sections
# Non-configurable items (no modifier groups)
SectionItem.create!(section: appetizer_section, item: fries, display_order: 1)
SectionItem.create!(section: main_course_section, item: salad, display_order: 1)

# Configurable items (with modifier groups)
SectionItem.create!(section: custom_section, item: burger, display_order: 1)
SectionItem.create!(section: custom_section, item: pizza, display_order: 2)

puts "Seed data created successfully with Chef's Signature Menu (no modifier groups) and Build Your Own Menu (with modifier groups)!"