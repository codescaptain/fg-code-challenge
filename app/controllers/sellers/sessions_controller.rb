# frozen_string_literal: true

class Sellers::SessionsController < Devise::SessionsController
  include Accessible
  skip_before_action :checkout_resources, only: :destroy
end
