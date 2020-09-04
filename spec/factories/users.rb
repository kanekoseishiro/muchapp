FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"a1a1a1a"}
    password_confirmation {password}
    age                   {20}
    gender                {2}
    prefecture            {2}
    phone_number          {11111111111}
    birthday              {"2000-1-1"}
  end
end