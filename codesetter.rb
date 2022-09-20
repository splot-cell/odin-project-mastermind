# frozen_string_literal: true

require_relative "player"
require_relative "user_input"
require_relative "text_content"

# class for game mode where human is codesetter
class HumanCodesetter < Player
  include UserInput
  def set_target_code
    @game.target_code = code_from_user(@game.code_length,
                                       @game.valid_code_elements)
  end
end

# class for game mode where computer is codesetter
class ComputerCodesetter < Player
  include TextContent
  def set_target_code
    thinking
    code = []
    @game.code_length.times { code.push(@game.valid_code_elements.sample) }
    @game.target_code = code
  end

  def thinking
    print setting_code
    3.times do
      print "."
      sleep(1)
    end
    puts "\nCODE SET!"
    sleep(1.5)
  end
end
