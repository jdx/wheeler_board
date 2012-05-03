module Admin
  class AdminController < ApplicationController
    before_filter :authenticate_admin

    private

    def authenticate_admin
      return false
    end
  end
end
