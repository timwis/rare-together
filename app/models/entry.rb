class Entry < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :symptoms
  
  validates :occurred_at, presence: true
  validate :has_symptom_or_body

  private

  def has_symptom_or_body
    unless symptoms.any? or body.present?
      errors.add(:body, "can't be blank if no symptoms are specified")
    end
  end
end
