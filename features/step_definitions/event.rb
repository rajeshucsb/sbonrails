Given /^events (.+)$/ do |events|

  events.split(',').each do |name|
    Factory(:event, :name => name)
  end

end

