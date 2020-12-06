filepath =  File.expand_path("~/Documents/Personal/aoc2020/inputs/day2.in")

part1 = open(filepath).readlines()
    .map { |l| l.match(/(\d+)\-(\d+) (.): (\w*)/)[1..-1] }
    .count { |min, max, c, password| password.count(c).between?(min.to_i, max.to_i) } 

part2 = open(filepath).readlines()
    .map { |l| l.match(/(\d+)\-(\d+) (.): (\w*)/)[1..-1] }
    .count { |min, max, c, password| password.split('').values_at(min.to_i - 1, max.to_i - 1).count(c) == 1 }

puts "Part 1 #{part1}"
puts "Part 2 #{part2}"