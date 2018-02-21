class Campaign < ApplicationRecord
  belongs_to :user
  has_many :members, dependent: destroy
  before_create :set_member
  before_create :set_status
  enum status: [:pending, :finished]
  validates :tittle, :description, :user, :status, presence: true

  def set_status
    self.status = :pending
  end

  def set_nember
    self.members << Member.create(name: self.user.name,
                                  email: self.user.email)
  end
end
