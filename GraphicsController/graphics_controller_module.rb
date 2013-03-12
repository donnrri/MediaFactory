require './GraphicsController/graphics_command_module'
require './Model/grid_object'
require './Utils/utilities'
module GraphicsControllerModule

=begin

     The purpose of this class is to decide which command should be called in response to a user command.
     The call method queries the GraphicsCommandModule::GraphicsCommand class method commands and retrieves
     a list of available command classes to call.

     The list of command class is itetrated through (line 33) and
     each has its validate method called. If the command class can  validate the user command, it then calls its
     execute method which creates, modifies or displays the grid of pixels in response to the user command.

=end

class GraphicsController

  include GraphicsCommandModule
  include GridModule

  attr_accessor :commands, :commander, :grid_object

  def initialize

    @commander =  GraphicsCommandModule::GraphicsCommand
    @grid_object = GridModule::GridObject.new
    @commands = @commander.commands

  end

  def call(input)

    validated = false
    clazz = nil

    # decide which command to call and execute it.
    @commands.each do |command|

      clazz = command.new
      clazz.execute(@grid_object)  if clazz.validate(input)

      return validated = true  if  clazz.validated

    end

    puts Utilities.warning unless @validated

  end


  def remove_command(value)

   @commands.delete(value)

  end


end  #end GraphicsController class

end   #end GraphicsModule