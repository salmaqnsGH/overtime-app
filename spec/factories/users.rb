FactoryBot.define do
    sequence :email do |n|
        "test-#{n}@mail.com"
    end

    factory :user do
        email {generate :email}
        password {"asdfasdf"}
        password_confirmation {"asdfasdf"}
        first_name { "sal"}
        last_name {"salam"}
    end
    factory :admin_user, class: "AdminUser" do
        email {generate :email}
        password {"asdfasdf"}
        password_confirmation {"asdfasdf"}
        first_name { "Admin"}
        last_name {"User"}
    end
  end
