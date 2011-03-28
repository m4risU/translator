class Project < ActiveRecord::Base
  belongs_to :user
  has_many :translations

  after_create :generate_secret_key
  after_create :generate_secret_confirmation

  private
  def generate_secret_key
    token = Devise.friendly_token
    if self.class.where(:secret_key => token).count > 0
      generate_secret_key
    else
      self.secret_key = token
      save
    end        
  end

  def generate_secret_confirmation
    token = Devise.friendly_token
    if self.class.where(:secret_confirmation => token).count > 0
      generate_secret_confirmation
    else
      self.secret_confirmation = token
      save
    end
  end
end
