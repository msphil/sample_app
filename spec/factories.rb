# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.id                    1
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end
Factory.define :activity do |activity|
  activity.user              1
  activity.last_login        Time.now
  activity.last_activity     Time.now
end
