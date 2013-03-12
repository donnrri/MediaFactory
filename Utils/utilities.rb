module Utilities

=begin
         The purpose of this class is to contain utility methods and constants used within the programme
         Any constants used can easily be modified within this module
=end
      def self.get_regex_string(i)

      COMMAND_REGEX[i]

      end

      def self.welcome

        WELCOME

      end

       def self.warning

         WARNING

       end

       def self.prompt

         PROMPT

       end


      def self.default_color

        DEFAULT_COLOR
      end

      def self.default_y_value

        DEFAULT_Y_VALUE
      end

# Constants used within the pogramme

COMMAND_LIST  = ["I", "C", "L", "V", "H", "S"]

DEFAULT_COLOR = "O"

WELCOME  = "Welcome to the graphics editor. Please enter your commands. "

WARNING  = "The entered command was not recognised. Please try again. The recognised commands are #{COMMAND_LIST.join(", ")}"

PROMPT   = '> '

DEFAULT_Y_VALUE = 250

end # end Utilities Module