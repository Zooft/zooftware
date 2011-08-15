class User < ActiveRecord::Base
  
  ## DEVISE
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  
  ## VALIDATIONS
  validates :username, :presence=>true, :uniqueness=>true

  ## ACCESSIBLE
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username


  def to_s
    "#{self.username} (#{self.email})"
  end

end
