class Event < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name,:the_date
end

