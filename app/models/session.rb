class Session < ActiveRecord::Base
  belongs_to :user

  before_validation :authenticate_account
  
  attr_accessor :login, :password, :match
 
  validates_presence_of :match,
    :message => 'for your name and password could not be found',
    :unless => :session_has_been_associated?
 
  before_save :associate_session_to_account
    
  private
  def authenticate_account
    unless session_has_been_associated?
      u = User.find_by_login_and_password(self.login, self.password)
      self.match = u if u
      errors.add_on_blank(:password) unless u
    end
  end
 
  def associate_session_to_account
    self.user_id ||= self.match.id
  end
 
  def session_has_been_associated?
    self.user_id
  end
end
