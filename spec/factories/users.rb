FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name             {'test'}
    first_name            {'test'}
    last_name_kana        {'test'}
    first_name_kana       {'test'}
    birth_date            {'00000000'}
  end
end