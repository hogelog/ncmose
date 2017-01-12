class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  if !Rails.env.test? && ENV['BASIC_AUTH_USERNAME'].present? &&  ENV['BASIC_AUTH_PASSWORD'].present?
    http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']
  end
end
