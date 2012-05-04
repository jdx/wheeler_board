class StatusesController < ApplicationController
  skip_before_filter :authenticate_employee!

  def show
    @current_wheeler = Wheeler.order('created_at desc, created_at desc').first
    render json: {
      current_wheeler: {
        employee: @current_wheeler.profile,
        lgtm_employee: @current_wheeler.lgtm_employee,
        reporter: @current_wheeler.reporter,
        date: view_context.time_ago_in_words(@current_wheeler.created_at),
        date_timestamp: @current_wheeler.created_at,
        description: @current_wheeler.description,
        info: @current_wheeler.to_s
      }
    }
  end
end
