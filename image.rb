class Image
  attr_accessor :photo

  def initialize(photo)
    @photo = photo
  end

  def get_ones
    ones =[]
    @photo.each_with_index do |row, row_num|
      row.each_with_index do |num_location, col_num|
        if num_location == 1
          ones << [row_num, col_num]
          #puts "A one is at: row #{row_num}, column #{col_num}"
        end
      end
    end
    ones
  end

  def blur!
    ones = get_ones
      @photo.each_with_index do |row, row_num|
        row.each_with_index do |num_location, col_num|
          ones.each do |row_coordinate, column_coordinate|

            if row_num == row_coordinate && col_num == column_coordinate
              @photo[row_num -1][col_num] = 1 unless row_num == 0
              @photo[row_num +1][col_num] = 1 unless row_num >= 3
              @photo[row_num][col_num -1] = 1 unless col_num == 0
              @photo[row_num][col_num +1] = 1 unless col_num >= 3
            end
          end
        end
      end
  end
                

  def output_image
      @photo.each do |data|
        puts data.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

puts "Original image"
image.get_ones
image.output_image
puts "Blurred image"
image.blur!

image.output_image