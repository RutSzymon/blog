class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :articles
  has_many :comments

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :surname, as: :admin
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :surname
  # attr_accessible :title, :body

  def full_name
    [name, surname].join(" ") if name.present? && surname.present?
  end

  def name_or_email
    full_name || email
  end
end
