class ApplicationController < ActionController::Base
  def initialize
    super
    # TODO: Remove it once authentication is in place
    @user = User.take
  end
end
