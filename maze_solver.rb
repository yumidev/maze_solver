require 'pry'

f = File.open "maze_map.txt", "r"

maze = f.readlines

maze.each do |line|
  puts line
end

def solve_maze
  f = File.open "maze_map.txt", "r"
  maze = f.readlines

  maze_column_length = maze[0].length
  maze_row_length = maze.length

  start_row = maze_row_length-2
  start_column = 1

  present_row = start_row
  present_column = start_column

  empty_space_check = [maze[present_row - 1][present_column], maze[present_row][present_column + 1], maze[present_row + 1][present_column], maze[present_row][present_column - 1]]
# when "E" is found, the game ends
  until empty_space_check.include?("E")
    case empty_space_check.index " "
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
    empty_space_check = [maze[present_row - 1][present_column], maze[present_row][present_column + 1], maze[present_row + 1][present_column], maze[present_row][present_column - 1]]
  end
  maze.each do |line|
    puts line
  end
end

solve_maze

f.close
