class User < ActiveRecord::Base
  attr_accessor :accepts_regulation  
  ## SCOPE
  scope :admin, where('is_admin=?', true)
  
  ## DEVISE
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  
  ## VALIDATIONS
  # validates :username, :presence=>true, :uniqueness=>true
  validates :first_name, :last_name, :presence=>true
  validates :accepts_regulation, :acceptance=>true

  ## ACCESSIBLE
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username,
                  :first_name, :last_name, :accepts_regulation
  
  
  def to_s
    "#{self.username} (#{self.email})"
  end

end
