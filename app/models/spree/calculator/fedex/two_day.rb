module Spree
  class Calculator
    module Fedex
      class TwoDay < Calculator::Fedex::Base
        def self.description
          I18n.t("fedex.two_day")
        end
      end
    end
  end
end
