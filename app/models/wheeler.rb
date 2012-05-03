class Wheeler < ActiveRecord::Base
  attr_accessible :employee_id, :lgtm_employee_id, :description, :date

  belongs_to :employee
  belongs_to :lgtm_employee, class_name: 'Employee'
  belongs_to :reporter, class_name: 'Employee'

  validate :valid_date?
  validates :employee, presence: true
  validates :reporter, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  validates :date, presence: true

  paginates_per 2

  private

  def valid_date?
    if date > Time.now
      errors.add(:date, "cannot be in the future")
    end
  end
end
