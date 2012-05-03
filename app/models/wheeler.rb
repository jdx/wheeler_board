class Wheeler < ActiveRecord::Base
  include ActionView::Helpers

  attr_accessible :profile_id, :lgtm_employee_id, :description, :date

  belongs_to :profile
  belongs_to :lgtm_employee, class_name: 'Employee'
  belongs_to :reporter, class_name: 'Employee'

  after_create :notify_campfire

  validate :valid_date?
  validates :profile, presence: true
  validates :reporter, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  validates :date, presence: true

  paginates_per 5

  def uptime
    prev_wheeler = Wheeler.where('date < ?', date).order('date desc').first
    time_ago_in_words Time.now - (date - prev_wheeler.date) if prev_wheeler
  end

  private

  def notify_campfire
    notification = "WheelerBoard: http://wheeler-board.tapjoy.net #{profile} broke Tapjoy #{time_ago_in_words(date)} ago. It's been #{uptime} since the last wheeler."
    notification += " lgtm'ed by #{lgtm_employee}." if lgtm_employee
    notification += "\"#{description}\" - #{reporter}"
    Rails.logger.info notification
    CAMPFIRE.speak notification if Rails.env.production?
  end

  def valid_date?
    if date > Time.now
      errors.add(:date, "cannot be in the future")
    end
  end
end
