module ActiveRecord
  class Base
    def valid_attribute?(*attributes)
      errors.clear

      attributes.flatten!

      if attributes.first.is_a?(Hash)
        attributes.first.each do |attribute, validator_types|
          validator_types = Array(validator_types)

          validators = self.class.validators_on(attribute).select do |validator|
            validator.kind.in?(validator_types)
          end

          validators.each do |validator|
            validator.validate(self)
          end
        end
      else
        Array(attributes).each do |attribute|
          self.class.validators_on(attribute).each do |validator|
            validator.validate(self)
          end
        end
      end

      errors.empty?
    end
  end
end
