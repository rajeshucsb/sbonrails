class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :presentation
  validates_presence_of :user_id,:presentation_id
  validate :user_cant_like_presentation_twice

  def user_cant_like_presentation_twice
    errors.add_to_base("user already likes this presentation!") if already_liked?
  end

  def already_liked?
    self.class.exists?(:user_id => user_id, :presentation_id => presentation_id)
  end

  def self.find_or_create( user, presentation )
    find_or_create_by_user_id_and_presentation_id( user.to_param, presentation.to_param )
  end

end

