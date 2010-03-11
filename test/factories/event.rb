Factory.define :event do |event|
  event.name                 { "Some talk" }
  event.the_date                 { Date.today }
  event.user                 { Factory(:email_confirmed_user) }
end

