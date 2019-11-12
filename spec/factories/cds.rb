FactoryBot.define do
  factory :cd do
    title  {'komiya no uta'}
    artist  {'komiya'}
    price  {1000}
    genre
    icon  {'cd1.png'}

    after(:create) do |cd|
      create(:stock, cd: cd)
    end
  end
end
