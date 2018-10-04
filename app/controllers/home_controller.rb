class HomeController < ApplicationController
  def index
    Rails.logger.info '*' * 30
    Rails.logger.info params.inspect
    Rails.logger.info '*' * 30
  end

  def about
  end
end
