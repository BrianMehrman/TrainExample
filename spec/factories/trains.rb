# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :train do
    train_line "el"
    route_name "blue"
    run_number "bl01"
    operator_id "blint"
  end
end
