module HRPG::Formatter::Colors

  COLORS = {
    :HP => :red,
    :MP => :green,
    :EXP => :yellow,
    :DAILIES => :light_magenta,
    :TODOS => :light_blue
  }

  def color(label)
    COLORS.has_key?(label) ? COLORS[label] : :default
  end

end
