FactoryBot.define do
  factory :purchase do
    postal_code           {'123-4567'}
    prefecture_id         {2}
    city                  {'横浜市緑区'}
    street_address        {'青山１−１−１'}
    telephone_number      {'09011111111'}
    token                 {"tok_abcdefghijk00000000000000000"}
  end
end