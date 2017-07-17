class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable, recoverable, :rememberable, :trackable, :registerable
  devise :database_authenticatable, :validatable

  def email_required?
  	false
  end

  def email_changed?
  	false
  end
end
