require 'pry'

f = File.open "maze1.txt", "r"

maze = f.readlines

maze.each do |line|
  puts line
end

def solve_maze
  f = File.open "maze1.txt", "r"
  maze = f.readlines

  maze_column_length = maze[0].length
  maze_row_length = maze.length

  start_row = maze_row_length-2
  start_column = 1

  present_row = start_row
  present_column = start_column

  north = maze[present_row - 1][present_column]
  south = maze[present_row + 1][present_column]
  east = maze[present_row][present_column + 1]
  west = maze[present_row][present_column - 1]
  nesw_array = [maze[present_row - 1][present_column], maze[present_row][present_column + 1], maze[present_row + 1][present_column], maze[present_row][present_column - 1]]
# when "E" is found, the game ends
  until nesw_array.include?("E")
    case nesw_array.index " "
    when 0
      maze[present_row - 1][present_column]="X"
      present_row -= 1
    when 1
      maze[present_row][present_column + 1]="X"
      present_column += 1
    when 2
      maze[present_row + 1][present_column]="X"
      present_row += 1
    when 3
      maze[present_row][present_column - 1]="X"
      present_column -= 1
    else
      puts "This maze can't be solved."
    end
    nesw_array = [maze[present_row - 1][present_column], maze[present_row][present_column + 1], maze[present_row + 1][present_column], maze[present_row][present_column - 1]]
    maze.each do |line|
      puts line
    end
  end
end

solve_maze

f.close
