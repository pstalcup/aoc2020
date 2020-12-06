# requires rails to be run for conveince split array method

filepath =  File.expand_path("~/Documents/Personal/aoc2020/inputs/day6.in")
groups = open(filepath).read.split("\n").split(&:empty?)

answer_counts = groups.map do |group|
    group.each_with_object(Hash.new { |h, k| h[k] = 0 }) do |passenger, counts|
        passenger.split('').each { |question| counts[question] += 1 }
    end
end

part1 = groups.zip(answer_counts).map { |group, counts| counts.select { |k, v| v > 0 }.length }
part2 = groups.zip(answer_counts).map { |group, counts| counts.select { |k, v| v == group.length }.length }

puts "Part 1 #{part1.sum}"
puts "Part 2 #{part2.sum}"