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

  def blur!(blur_dist)
    ones = get_ones

    @photo.each_with_index do |row, row_num|
      row.each_with_index do |num_location, col_num|
        ones.each do |row_coordinate, column_coordinate|
          if manhattan_dist(row_num, col_num, row_coordinate, column_coordinate) <= blur_dist
            @photo[row_num][col_num] = 1
          end
        end
      end
    end
  end

  def manhattan_dist (x1, y1, x2, y2)
    horizantal_dist = (x2 - x1).abs
    vertical_dist = (y2 - y1).abs
    horizantal_dist + vertical_dist
  end

  def output_image
      @photo.each do |data|
        puts data.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
])


puts "Original image"
image.get_ones
image.output_image
puts "Blurred image"
image.blur!(2)

image.output_image






