class StatusesController < ApplicationController
  skip_before_filter :authenticate_employee!

  def show
    @current_wheeler = Wheeler.order('date desc, created_at desc').first
    render json: {
      current_wheeler: {
        employee: @current_wheeler.employee,
        lgtm_employee: @current_wheeler.lgtm_employee,
        reporter: @current_wheeler.reporter,
        date: view_context.time_ago_in_words(@current_wheeler.date),
        date_timestamp: @current_wheeler.date,
        description: @current_wheeler.description
      }
    }
  end
end
