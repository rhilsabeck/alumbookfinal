# Created by Victor, edited by Leiyang Guo and Maxwell Barvian
class User < ActiveRecord::Base
  # Generates CSV of
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ['program', 'company_id']
  end

  # Leiyang Guo and Victor Bashorun set association

  belongs_to :login
  belongs_to :company
  has_one :saved_lists, through: :saved_list_users
  has_many :saved_list_users, dependent: :destroy
  has_many :user_surveys
  has_many :surveys, through: :user_surveys
  has_many :giving_backs, dependent: :destroy
  has_many :user_phones, dependent: :destroy
  has_many :undergraduate_degrees, dependent: :destroy
  has_many :graduate_degrees, dependent: :destroy

  # PaperClip avatar
  has_attached_file :avatar, styles: { full: '500x500#', medium: '300x300#', thumb: '100x100#' }, default_url: '/images/profile.svg'

  #enum status: [ :currently_enrolled, :alumni ]
  enum state: Geography::US_STATES.keys.map { |k| k.to_sym }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  accepts_nested_attributes_for :login
  accepts_nested_attributes_for :company
  accepts_nested_attributes_for :user_phones, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :undergraduate_degrees, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :graduate_degrees, reject_if: :all_blank, allow_destroy: true
end
