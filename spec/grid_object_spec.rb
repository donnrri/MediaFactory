require "rspec"
require "./Model/grid_object"
require "./Utils/utilities"



describe GridModule do

    before(:each) do

      @grid= GridModule::GridObject.new
      @grid.make_grid(10, 10)

    end
    describe "#set_working_values"  do

      it "should take any number of arguments and return an equal number of values " do

        array = @grid.set_working_values("1", "2", "3" , "4")
        array.length.should == 4

        array = @grid.set_working_values("1", "2")
        array.length.should == 2


      end
      it "should take an array of  string representations of a numbers and  return an array of integers which are value - 1" do

      array = @grid.set_working_values("1", "2")
      var1 = array[0]
      var2 = array[1]

      var1.should == 0
      var2.should == 1

      end
    end

    describe "#make_grid"  do

      it "should take an x_value a y_value and a color value and create an x_value('10')  by y_value ('10')array of arrays " do

        array = []
        array = @grid.grid_data
        array.length.should == 10
        array.each {|i| i.length.should == 10}
        array.each {|i| i.should be_an_instance_of(Array)}

      end

      it "should have each element containing the String value representing the default color value ('0')" do

        array = []
        array = @grid.grid_data
        array.each {|i| i.each{|x| x.should == "O"}}

      end
    end

    describe "#get_rows"  do

      context "the @grid.make_grid method has been run"   do

        it "should return each row of the array of array collection"  do


        @grid.get_rows{|item, index| item.length.should == 10}

          end
      end
    end

     describe "#change_color_in_range"  do


        it "should change the color of  specified range of pixels . Range equals all elements"   do

        array = ["O","O","O","O","O"]
        array = @grid.change_color_in_range(array, 0, 5, "P")
        array.all?{|i| i == "P"}

         end

       it "should change the color of  specified range of pixels . Range equals first two elements"    do

         array = ["O","O","O","O","O"]
         array = @grid.change_color_in_range(array, 0, 1, "P")
         array[0].should == "P"
         array[1].should == "P"
         array[2].should == "O"


        end
     end

    describe "#clear_grid" do

      it "should be able to add an array of colored pixels to data structure representing grid"   do

        @grid.make_grid(3,3)
        test_array = %w(P P P)
        (@grid.grid_data ||= []) <<  test_array

        @grid.grid_data[3].should include("P")

      end
      it "should revert the elements of the grid_data array to the default color ('O')"   do

      @grid.clear_grid
      array = @grid.grid_data
      array.each{|i| i.each{|x| x.should == "O"}}

      end
    end




end