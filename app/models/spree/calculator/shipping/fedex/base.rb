require_dependency 'spree/calculator'

module Spree
  module Calculator::Shipping
    module Fedex
      class Base < Spree::Calculator::Shipping::ActiveShipping::Base

        preference :fedex_account, :string, default: -> { Spree::ActiveShipping::Config[:fedex_account] }
        preference :fedex_login, :string, default: -> { Spree::ActiveShipping::Config[:fedex_login] }
        preference :fedex_password, :string, default: -> { Spree::ActiveShipping::Config[:fedex_password] }
        preference :fedex_key, :string, default: -> { Spree::ActiveShipping::Config[:fedex_key] }
        preference :test_mode, :boolean, default: -> { Spree::ActiveShipping::Config[:test_mode] }

        def carrier
          carrier_details = {
            :key => preferred_fedex_key,
            :password => preferred_fedex_password,
            :account => preferred_fedex_account,
            :login => preferred_fedex_login,
            :test => preferred_test_mode
          }

          ActiveShipping::FedEx.new(carrier_details)
        end
      end
    end
  end
end
