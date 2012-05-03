class Wheeler < ActiveRecord::Base
  include ActionView::Helpers

  attr_accessible :profile_id, :lgtm_employee_id, :description, :date

  belongs_to :profile
  belongs_to :lgtm_employee, class_name: 'Employee'
  belongs_to :reporter, class_name: 'Employee'

  after_create :notify_campfire
  after_create :recalculate_uptime
  after_save :recalculate_uptime

  validate :valid_date?
  validates :profile, presence: true
  validates :reporter, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  validates :date, presence: true

  paginates_per 5

  def prev_wheeler
    Wheeler.where('date < ?', date).order('date desc').first
  end

  def uptime_in_words
    time_ago_in_words DateTime.now - uptime.seconds
  end

  def recalculate_uptime
    if prev_wheeler
      update_column :uptime, (date - prev_wheeler.date).to_i
    else
      update_column :uptime, 0
    end
  end

  private

  def notify_campfire
    notification = "WheelerBoard: http://wheeler-board.tapjoy.net #{profile} broke Tapjoy #{time_ago_in_words(date)} ago. It's been #{uptime_in_words} since the last wheeler."
    notification += " lgtm'ed by #{lgtm_employee}." if lgtm_employee
    notification += " \"#{description}\" - #{reporter}"
    Rails.logger.info notification
    CAMPFIRE.speak notification if Rails.env.production?
  end

  def valid_date?
    if date > Time.now
      errors.add(:date, "cannot be in the future")
    end
  end
end
