FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'t00000'}
    password_confirmation {password}
    family_name           {'あ'}
    first_name            {'あ'}
    family_name_kana      {'ア'}
    first_name_kana       {'ア'}
    birthday              {'1930-01-01'}
  end
end