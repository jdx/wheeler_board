class StatusesController < ApplicationController
  skip_before_filter :authenticate_employee!

  def show
    render json: {
      who: 'Mike Wheeler',
      when: view_context.time_ago_in_words(Date.yesterday),
      when_timestamp: Date.today,
      why: 'he sucks'
    }
  end
end
