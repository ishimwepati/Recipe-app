module ApplicationHelper
  def display_quantity(quantity, measurement_unit)
    case measurement_unit.downcase
    when 'kilograms', 'kg', 'kilogram'
      "#{quantity} kg"
    when 'grams', 'g'
      "#{quantity} g"
    when 'units'
      "#{quantity} units"
    else
      "#{quantity} #{measurement_unit}" # fallback for other cases
    end
  end
end
