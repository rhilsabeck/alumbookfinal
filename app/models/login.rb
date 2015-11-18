#Created by Victor
#Modified by Joe Sortino

class Login < ActiveRecord::Base
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :registerable,

  #Joe Sortino - added for allowing devise to login with username
  attr_accessor :logon
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:logon]

  has_one :user, dependent: :destroy

  has_many :saved_lists, dependent: :destroy
  has_many :surveys

  self.inheritance_column = nil

  enum type: [ :worker, :admin, :user ]

  #Joe Sortino - use username for validation when logging in
  validates :username, :email, :presence => true, :uniqueness => {:case_sensitive => false}
  #Brad Bilter - added to enforce some rules for adding logins
  validates :last_name, :first_name, :middle_initial, :presence => true, :on => :update

  accepts_nested_attributes_for :user

  #Joe Sortino - change authentication_keys to allow for username login
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if logon = conditions.delete(:logon)
      where(conditions.to_hash).where(["username = :value OR email = :value", { :value => logon.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ['username', 'first_name', 'last_name']
  end

  def authorized_to_show_profile?(id)
    id == user? || admin? || worker?
  end

  def authorized_to_edit_profile?(id)
    id == user.id
  end

  def authorized_to_edit_account?(id)
    login = Login.find(id)
    (admin? && !login.admin?) || self.id == id || (worker? && login.user?)
  end
#Ryan Hilsabeck added this method
    def authorized_to_delete_account?(id)
    login = Login.find(id)
    (admin? && !login.admin?) || self.id == id || (worker? && login.user?)
  end

  def full_name
    "#{first_name.camelize }  #{last_name.camelize}"
  end
end
