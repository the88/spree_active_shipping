module Spree
  class Calculator
    module Fedex
      class InternationalGround < Calculator::Fedex::Base
        def self.description
          I18n.t("fedex.intl_ground")
        end
      end
    end
  end
end
