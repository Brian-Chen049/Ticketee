class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :author, class_name: "User"
  belongs_to :state
  validates :name, presence: true
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank
  validates :description, presence: true, length: {minimum: 10}
  has_many :comments, dependent: :destroy
end
