FactoryBot.define do
  factory :user do
    id {}
    name {'test'}
    email {'komi@example.com'}
    password_digest {'password'}
    admin {true}

    # 有効化
    #activated true
  end
end

#  factory :other_user do
#    name "Admin"
#    sequence(:email) { |n| "tester#{n}@admin.com" }
#    password "admin"
#    password_confirmation "admin"
#    # 有効化
#    #activated true
#  end
#end
