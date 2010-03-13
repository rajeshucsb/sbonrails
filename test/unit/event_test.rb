require 'test_helper'

class EventTest < ActiveSupport::TestCase
  should_belong_to :user
  should_validate_presence_of :name,:the_date
end

