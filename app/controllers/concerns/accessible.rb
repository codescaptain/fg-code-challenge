module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :checkout_resources
  end

  protected

  def checkout_resources
    if seller_signed_in?
      flash.clear
      redirect_to(sellers_authenticated_root_path) and return
    elsif user_signed_in?
      flash.clear
      redirect_to(users_authenticated_root_path) and return
    end
  end
end
