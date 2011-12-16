Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :name do |n|
  "Person #{n}"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end
Factory.define :compare do |compare|
  compare "Foo bar"
  compare.association :user
end

Factory.define :idea do |idea|
  idea.content "Foo bar"
  idea.association :user
end

Factory.define :line do |line|
  line.content "Foo bar"
  line.association :user
end
Factory.define :message do |message|
  message.line_id 1
  #  message.user_id 2
  message.association :user
end
Factory.define :smart do |smart|
  smart.question "1+3"
  #  message.user_id 2
  smart.association :user
end
Factory.define :quiz do |smart|
  smart.question "1+3"
  #  message.user_id 2
  smart.association :compare
end

