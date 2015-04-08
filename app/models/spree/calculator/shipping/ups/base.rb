require_dependency 'spree/calculator'

module Spree
  module Calculator::Shipping
    module Ups
      class Base < Spree::Calculator::Shipping::ActiveShipping::Base

        preference :ups_login, :string, default: -> { Spree::ActiveShipping::Config[:ups_login] }
        preference :ups_password, :string, default: -> { Spree::ActiveShipping::Config[:ups_password] }
        preference :ups_key, :string, default: -> { Spree::ActiveShipping::Config[:ups_key] }
        preference :shipper_number, :string, default: -> { Spree::ActiveShipping::Config[:shipper_number] }
        preference :test_mode, :boolean, default: -> { Spree::ActiveShipping::Config[:test_mode] }


        def carrier
          carrier_details = {
            :login => preferred_ups_login,
            :password => preferred_ups_password,
            :key => preferred_ups_key,
            :test => preferred_test_mode
          }

          if preferred_shipper_number.present?
            carrier_details.merge!(:origin_account => preferred_shipper_number)
          end

          ::ActiveShipping::UPS.new(carrier_details)
        end

        protected
        # weight limit in ounces http://www.ups.com/content/us/en/resources/prepare/oversize.html
        def max_weight_for_country(country)
          2400    # 150 lbs
        end
      end
    end
  end
end
