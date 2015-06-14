require "colorize"

module HRPG::Formatter::Graph

  BAR_SIZE = 20

  def bar(value, max, color)
    percent = value.to_f/max.to_f
    blocks = (percent * BAR_SIZE).floor
    spaces = BAR_SIZE - blocks
    bar = ("■" * blocks).colorize(color)
    space = " " * spaces
    endpost = "|".colorize(:light_black)
    "#{endpost}#{bar}#{space}#{endpost}"
  end

  def statbar(label, value, max)
    description = label.to_s.ljust(7).colorize(color(label))
    chart = bar(value, max, color(label))
    of = "/#{max.to_i}".colorize(:light_black)
    numeric = "#{value.to_i}#{of}".rjust(10)
    "#{description} #{chart} #{numeric}"
  end

end
