filepath =  File.expand_path("~/Documents/Personal/aoc2020/inputs/day4.in")
s = open(filepath).read

def valid?(key, value)
  case key
  when "byr"
    value.match(%r{\d{4}}) && value.to_i.between?(1920, 2002)
  when "iyr"
    value.match(%r{\d{4}}) && value.to_i.between?(2010, 2020)
  when "eyr"
    value.match(%r{\d{4}}) && value.to_i.between?(2020, 2030)
  when "hgt"
    c = value.match(%r{(\d{2,3})(in|cm)})
    if c.present?
      ht, unit = c[1..2]
      case unit
      when "in"
        ht.to_i.between?(59, 76)
      when "cm"
        ht.to_i.between?(150, 193)
      else
        false
      end
    else
      false
    end
  when "hcl"
    value.match(%r{#[0-9a-f]{6}})
  when "ecl"
    %w{amb blu brn gry grn hzl oth}.include? value
  when "pid"
    value.match(%r{\d{9}})
  else
    false
  end
end

required_values = s.split("\n").reduce([]) do |a, l|
  l.blank? ? a + [l] : [*a[0..-2], "#{(a[-1]||'')} #{l}"]
end.map do |l|
  Hash[l.split.map { |p| p.match(%r{(\S{3}):(.*)})[1..2] }]
end.map do |h|
  h.slice(*%w{byr iyr eyr hgt hcl ecl pid})
end

part1 = required_values.select { |h| h.length == 7 }
part2 = part1.select { |h| required_values.all? { |k, v| valid?(k, v)} }

puts "Part 1 #{part1.length}"
puts "Part 2 #{part2.length}"