require './Utils/utilities'

=begin
      The purpose of this class is to contain methods to create, manipulate or display the grid of pixels.

=end
module GridModule

  class GridObject

  attr_accessor :grid_data

  include Utilities

  def initialize

    @grid_data = []
    @default_color      = Utilities.default_color
    @default_row_limit  = Utilities.default_y_value
  end



   def make_grid(x_value, y_value)

     @grid_data = []

     if x_value.to_i > @default_row_limit
       x_value = 250
     end

     1.upto(y_value.to_i).each do |i|

       row_data = []

       1.upto(x_value.to_i) { |x|  row_data << @default_color }

       @grid_data << row_data

     end

     return @grid_data

   end


  def get_rows

    @grid_data.each_with_index do |row_item, row_index|

      selected_row =[]
      selected_row = yield(row_item, row_index) if block_given?
      @grid_data[row_index] = selected_row

    end

    return @grid_data

  end


  def get_row_items

    @grid_data.each_with_index do |row_item, row_index|

    selected_row = []
    selected_row = row_item
     selected_row.each_with_index do | column_item, column_index|

        selected_row[column_index] = yield(column_item, column_index) if block_given?

      end

      @grid_data[row_index] = selected_row

    end

    return @grid_data
  end


   def set_working_values(*args)

      @args = args
      @args.each_with_index do |item ,index|

      var = Integer(item)
      var -=1
      @args[index] = var
      end

      return @args
   end


  def change_color_in_range(array, start_value, end_value, color)

    array.each_index do |index|

      array[index] = color if index >= start_value and index <= end_value

    end

      return array
  end


  # @return [Object]
  def clear_grid

   get_row_items() do |item , index|

      item = @default_color

   end

  end



  def draw_vertical_segment(x_value, start_y_value, end_y_value, color)

    x_value, start_y_value, end_y_value  = set_working_values(x_value, start_y_value, end_y_value)
    pixel_color = color
    get_rows do |item, index|

     selected_row = []
     selected_row = item

     (index >= start_y_value and index <= end_y_value) ?
         selected_row = change_color_in_range(selected_row, x_value, x_value, pixel_color) :
         selected_row = selected_row
    end

  end


  def draw_horizontal_segment(start_x_value, end_x_value, y_value, color)

     start_x_value, end_x_value, y_value  = set_working_values(start_x_value, end_x_value, y_value)
     pixel_color =  color

     get_rows do |item, index|

       selected_row = []
       selected_row = item

       index == y_value ?
           selected_row = change_color_in_range(selected_row, start_x_value, end_x_value, pixel_color) :
           selected_row = selected_row
     end

  end


   def color_pixel(x_value, y_value, color)

     x_value, y_value  = set_working_values(x_value, y_value)
     pixel_color =  color

     get_rows do |item, index|

       selected_row = []
       selected_row = item

       index == y_value ?
           selected_row = change_color_in_range(selected_row, x_value, x_value, pixel_color) :
           selected_row = selected_row
     end

   end


  def color_region(x_value, y_value, color)

    x_value, y_value  = set_working_values(x_value, y_value)
    start_x_value = 0
    start_y_value = 0
    pixel_color   =  color

    get_rows do |item, index|

      selected_row = []
      selected_row = item
      (index >= start_y_value and index <= y_value) ?
          selected_row = change_color_in_range(selected_row, start_x_value, x_value, pixel_color) :
          selected_row = selected_row

    end

  end


  def draw_grid

      get_rows do |i|

        puts i.join(" " )
        i
      end
  end


  # @return [Object]
  def end_programme

    abort("Closing programme")
  end

end
end