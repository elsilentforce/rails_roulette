module SharedMethods
  extend ActiveSupport::Concern


  module ClassMethods
    
    # Sets a target color with different percentages
    def set_color
      case rand(100) + 1 # Gives you the 100%
      when (1..2) then "Green" # 2% chance
      when (3..47) then "Red" # 49% chance
      when (48..100) then "Black" # 49% chance
      end
    end

  end

end
