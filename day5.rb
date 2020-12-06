filepath =  File.expand_path("~/Documents/Personal/aoc2020/inputs/day5.in")

ls = open(filepath).read.split
n = ls.map { |l| l.gsub(%r{[FL]}, "0").gsub(%r{[BR]}, "1").to_i(2) }.sort
r = Range.new(*n.minmax)

part1 = n[-1]
part2 = n.zip(r).find { |a,b| a != b }[1]

puts "Part 1 #{part1}"
puts "Part 2 #{part2}"
