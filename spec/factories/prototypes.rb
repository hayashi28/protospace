require 'faker'

FactoryGirl.define do
  factory :prototype do
    title          { Faker::Commerce.product_name }
    catchcopy      { Faker::Lorem.sentence }
    concept        { Faker::Lorem.sentence }
    user
  end
end
