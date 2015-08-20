class Person < ActiveRecord::Base
  def full_name
    return "#{first_name} #{last_name}"
  end
  def describe
    return "#{full_name} #{last_name} is #{age} years old and is #{hair_color}"
  end
end
