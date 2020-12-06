filepath =  File.expand_path("~/Documents/Personal/aoc2020/inputs/day1.in")
i = open(filepath).split.map(&:to_i)

part1 =  i.product(i).select { |l| l.reduce(&:+) == 2020  }.map { |l| l.reduce(&:*) }.first
part2 =  i.product(i, i).select { |l| l.reduce(&:+) == 2020  }.map { |l| l.reduce(&:*) }.first

puts "Part 1 #{part1}"
puts "Part 2 #{part2}"