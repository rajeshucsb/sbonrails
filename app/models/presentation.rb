class Presentation < ActiveRecord::Base

  #-------------------------------------
  # STATE MACHINE
  #-------------------------------------
  include AASM

  aasm_column :state
  aasm_initial_state :idea
  aasm_state :idea
  aasm_state :upcoming
  aasm_state :archived

  aasm_event :set_upcoming do
    transitions :to => :upcoming, :from => :idea, :guard => :valid?
  end

  aasm_event :presentation_date_has_passed do
    transitions :to => :archived, :from => :upcoming
  end

  #-------------------------------------
  # VALIDATIONS
  #-------------------------------------
  validates_presence_of   :title, :owner_id
  validates_uniqueness_of :title, :scope => [:presenter_id, :owner_id]

  validates_presence_of   :date,         :if => :upcoming_state?
  validates_presence_of   :presenter_id, :if => :upcoming_state?

  #-------------------------------------
  # ASSOCIATIONS
  #-------------------------------------
  belongs_to :presenter, :class_name => "User"
  belongs_to :owner, :class_name => "User"
  has_many   :likes
  has_many   :users_who_like_this, :through => :likes, :source => :user


  #-------------------------------------
  # NAMED SCOPES
  #-------------------------------------
  named_scope :archived, :conditions => { :state => 'archived' }, :order => 'date DESC'
  named_scope :ideas,    :conditions => { :state => 'idea'  },    :order => 'created_at DESC'
  named_scope :upcoming, :conditions => { :state => 'upcoming' }, :order => 'date ASC'

  named_scope :sorted_by_likes,
              :joins => 'left outer join likes on likes.presentation_id = presentations.id',
              :group => "presentations.id",
              :order => 'COUNT(likes.id) DESC'



  #-------------------------------------
  # PUBLIC METHODS
  #-------------------------------------
  def self.sorted_by_likes_slow(options = nil)
    Presentation.ideas.all(options).sort {|a,b| b.num_likes <=> a.num_likes  }
  end

  def num_likes
    likes.count
  end

  #-------------------------------------
  # PRIVATE METHODS
  #-------------------------------------
  private
    def upcoming_state?
      state == "upcoming"
    end

end

