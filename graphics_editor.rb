
require './GraphicsController/graphics_controller_module'
require './Utils/utilities'

=begin
        This is the 'main' file of the programme
=end

class GraphicsEditor


  include GraphicsCommandModule
  include GraphicsControllerModule
  include Utilities


  attr_accessor :current_command,  :prompt, :commander


   def initialize

     @prompt = Utilities.prompt

     puts Utilities.welcome

     @commander = GraphicsControllerModule::GraphicsController.new

     prompt(@prompt)

   end




  def prompt(*args)

   print(*args)

   @current_command = STDIN.gets.chomp

   @commander.call(@current_command)

   prompt(@prompt)
  end



end

ge = GraphicsEditor.new




