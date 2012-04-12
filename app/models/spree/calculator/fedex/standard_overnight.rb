module Spree
  class Calculator
    module Fedex
      class StandardOvernight < Calculator::Fedex::Base
        def self.description
          I18n.t("fedex.standard_overnight")
        end
      end
    end
  end
end
