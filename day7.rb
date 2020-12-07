filepath =  File.expand_path("~/Documents/Personal/aoc2020/inputs/day7.in")
all_rules = open(filepath).read

some_bags = all_rules.scan(%r{([a-z ]+) bags? contains?((?: ?\d+ [a-z ]+ bags?,?)+)\.}).map do |b, r| 
    [b, r.strip.scan(%r{(\d+) ([a-z]+ [a-z]+) bags?})]
end.to_h

def part1_r(target, bag_color, some_bags)
    if bag_color == target
        1
    elsif some_bags.include?(bag_color)
        some_bags[bag_color].map do |qt, inner_bag| 
            part1_r(target, inner_bag, some_bags) 
        end.sum
    else
        0
    end
end
part1 = some_bags.keys.select { |bag_color| bag_color != "shiny gold" && part1_r("shiny gold", bag_color, some_bags) > 0 }.count

def part2_r(bag_color, some_bags)
    if some_bags.include?(bag_color)
        1 + some_bags[bag_color].map { |qt, inner| qt.to_i * part2_r(inner, some_bags) }.sum
    else
        1
    end
end
part2 = part2_r("shiny gold", some_bags)
