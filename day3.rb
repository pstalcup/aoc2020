filepath =  File.expand_path("~/Documents/Personal/aoc2020/inputs/day3.in")

# requires rails for some convenience methods on array

part1 = open(filepath).read.split.each_with_index.count { |l, i| l.chomp[i*3 % l.length] == "#" }
part2 = open(filepath).read.split
    .each_with_index.map do |l, i| 
        [1, 3, 5, 7, [1, 2]].map { |n, m=1| l[(i/m)*n % l.length] == "#" && i % m == 0 ? 1 : 0 } 
    end.transpose.map(&:sum).reduce(&:*)

puts "Part 1 #{part1}"
puts "Part 2 #{part2}"