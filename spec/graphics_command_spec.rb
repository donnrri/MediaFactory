require "rspec"
require './GraphicsController/graphics_command_module'


describe GraphicsCommandModule do

  describe "#GraphicsCommand" do

    context " in this example there are 8 subclasses of GraphicsCommand"  do

      before(:each) do

        @commander = GraphicsCommandModule::GraphicsCommand
        @commands = @commander.commands

      end

      it 'should return an array from the commands method' do

         @commands.should be_an_instance_of(Array)
    end

      it " should return an array of all subclasses of GraphicsCommand" do


         @commands.length.should == 8

      end

    end

  end

  describe "#CreateGraphicsCommand" do

      it " should have a validate command which correctly validates the command 'I M N' where 'M' and 'N' are integers"   do
        test = "I 77 80"
        @create = GraphicsCommandModule::CreateGraphicsCommand.new
        @create.validate(test).should == true

      end

  end

  describe "#ClearGraphicsCommand" do

    it " should have a validate command which correctly validates the command 'C'"   do
      test = "C"
      @create = GraphicsCommandModule::ClearGraphicsCommand.new
      @create.validate(test).should == true

    end

  end

  describe "#ColorPixelGraphicsCommand" do

    it " should have a validate command which correctly validates the command 'L M N C' where 'M' and 'N' are integers"   do
      test = "L 5 5 P"
      @create = GraphicsCommandModule::ColorPixelGraphicsCommand.new
      @create.validate(test).should == true

     end

  end

  describe "#ColorColumnGraphicsCommand" do

    it " should have a validate command which correctly validates the command 'V M N P C' where 'M' , 'N', 'P' are integers"   do
      test = "V 5 5 6 P"
      @create = GraphicsCommandModule::ColorColumnGraphicsCommand.new
      @create.validate(test).should == true

    end

  end

  describe "#ColorRowGraphicsCommand" do

    it " should have a validate command which correctly validates the command 'H M N P C' where 'M' , 'N', 'P' are integers"   do
      test = "H 5 5 6 P"
      @create = GraphicsCommandModule::ColorRowGraphicsCommand.new
      @create.validate(test).should == true

    end

  end

  describe "#ColorRegionGraphicsCommand" do

    it " should have a validate command which correctly validates the command 'F M N C' where 'M' and 'N' are integers"   do
      test = "F 5 5 P"
      @create = GraphicsCommandModule::ColorRegionGraphicsCommand.new
      @create.validate(test).should == true

    end

  end

  describe "#DrawGraphicsCommand" do

    it " should have a validate command which correctly validates the command 'S' "   do
      test = "S"
      @create = GraphicsCommandModule::DrawGraphicsCommand.new
      @create.validate(test).should == true

    end

  end

  describe "#QuitGraphicsCommand" do

    it " should have a validate command which correctly validates the command 'X' "   do
      test = "X"
      @create = GraphicsCommandModule::QuitGraphicsCommand.new
      @create.validate(test).should == true

    end

  end
end