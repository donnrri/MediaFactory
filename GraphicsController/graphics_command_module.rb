require './Utils/utilities'

=begin
     The purpose of these classes is to provide command classes to create, modify and display the
     data structure representing the grid of 'pixels' (color is represented by letters).

     The super class "GraphicsCommand"  uses the inhertied hook to notify itself of all its subclasses and
     build an array of these,  which is then used to select the correct command class to use in response
     to a command issued by the user.

     Each subclass of the GraphicsCommand class overrides the super class 'validate' and 'execute' methods.
     This enables the classes to validate a specific user command and create, modify or render the grid of
     pixels.

=end

module GraphicsCommandModule


  class GraphicsCommand

   include Utilities


   attr_accessor :grid_object, :command_types, :validated

   @command_types = []


    def self.inherited(subclass)

     @command_types.push(subclass)

    end

     def self.commands

       @command_types
     end


    def validate(input)

    #To be overriden in subclasses

    end

    def execute

      # to be overriden in subclasses
    end

  end   # end GraphicsCommand class

  # Class handles create grid command  "I M N"
  class CreateGraphicsCommand < GraphicsCommand

       attr_reader :x_value, :y_value

      def initialize

        super()


      end

      def validate(input)


        input[/^I\s(\d+)\s(\d+)/]
        @x_value,  @y_value = $1 , $2

        return true if @x_value && y_value


      end

      def execute(grid)

      grid.make_grid(@x_value, @y_value)

        return @validated = true
      end

  end     # end CreateGraphicsCommand class

  #Class handles clear grid command "C"
  class ClearGraphicsCommand < GraphicsCommand

    def initialize()

      super()


    end

    def validate(input)

     regex = /^C/
     m = regex.match(input)

     return true unless m.nil?


    end

    def execute(grid)

      grid.clear_grid

      return @validated = true

    end

  end   # end ClearGraphicsCommand class

  #Class handles color pixel command "L X Y C"
  class ColorPixelGraphicsCommand < GraphicsCommand

    def initialize()

      super()


    end

    def validate(input)


      input[/^L\s+(\d+)\s+(\d+)\s+(\w+)/]

      @x_value,  @y_value, @color = $1 , $2 , $3

      return true if @x_value and @y_value and @color
    end

    def execute(grid)

      grid.color_pixel(@x_value, @y_value, @color)

      return @validated = true
    end

  end   # end ColorPixelGraphicsCommand class

  #Class handles  color column command "V X Y1 Y2 C"
  class ColorColumnGraphicsCommand < GraphicsCommand

    def initialize()

      super()


    end

    def validate(input)


      input[/^V\s+(\d+)\s+(\d+)\s+(\d+)\s+(\w+)/]
      @x_value,  @y_start_value, @y_end_value, @color = $1 , $2, $3, $4

      return true if  @x_value and @y_start_value and @y_end_value and @color

    end

    def execute(grid)

      grid.draw_vertical_segment( @x_value, @y_start_value, @y_end_value, @color)

      return @validated = true
    end

  end     # end ColorColumnGraphicsCommand class

  # Class handles color row command "H X1 X2 Y C"
  class ColorRowGraphicsCommand < GraphicsCommand

    def initialize()

      super()


    end

    def validate(input)


      input[/^H\s+(\d+)\s+(\d+)\s+(\d+)\s+(\w+)/]
      @x_value,  @x_value_end, @y_value, @color = $1 , $2, $3, $4

      return true if @x_value and @x_value_end and  @y_value and @color

    end

    def execute(grid)

      grid.draw_horizontal_segment( @x_value, @x_value_end, @y_value, @color)

      return @validated = true
    end

  end   # end ColorRowGraphicsCommand class

  #Class handles color region of grid  command "F X Y C"
  class ColorRegionGraphicsCommand < GraphicsCommand

    def initialize()

      super()


    end

    def validate(input)

      input [/^F\s+(\d+)\s+(\d+)\s+(\w+)/]
      @x_value, @y_value, @color = $1 , $2 , $3
      return true if @x_value and @y_value and @color

    end

    def execute(grid)

      grid.color_region(@x_value, @y_value, @color)
      return @validated = true
    end

  end    # end ColorRegionGraphicsCommand class

  #Class handles draw grid command "S"
  class DrawGraphicsCommand < GraphicsCommand

    def initialize()

      super()


    end

    def validate(input)

      regex = /^S/
      m = regex.match(input)

      return true unless m.nil?

    end

    def execute(grid)

      grid.draw_grid
      return @validated = true
    end

  end     # end DrawGraphicsCommand class

  #Class handles quit application command "X"
  class QuitGraphicsCommand < GraphicsCommand

    def initialize()

      super()


    end

    def validate(input)

      regex = /^X/
      m = regex.match(input)

      return true unless m.nil?

    end

    # @param [Object] grid
    def execute(grid)


      grid.end_programme
      return @validated = true

    end

  end  # end QuitGraphicsCommand class
end  # end GraphicsCommandModule class