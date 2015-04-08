require_dependency 'spree/calculator'

module Spree
  module Calculator::Shipping
    module CanadaPost
      class Base < Spree::Calculator::Shipping::ActiveShipping::Base

        preference :canada_post_login, :string, default: -> { Spree::ActiveShipping::Config[:canada_post_login] }

        def carrier
          canada_post_options = {
            :login  => preferred_canada_post_login,
            :french => (I18n.locale.to_sym == :fr)
          }
          ActiveShipping::CanadaPost.new(canada_post_options)
        end
      end
    end
  end
end
