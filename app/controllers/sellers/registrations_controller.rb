# frozen_string_literal: true

class Sellers::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :checkout_resources, except: %i[new create]
end
