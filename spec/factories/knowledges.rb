FactoryGirl.define do
  factory :knowledge do
    item "JavaScript"
    level 10
  end

  factory :overpowered, class: Knowledge do
    item "Python"
    level 20
  end

end
