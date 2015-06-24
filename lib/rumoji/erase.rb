module Rumoji
  def erase(str)
    str.gsub(/:([^s:]?[\w-]+):/) do |sym|
      Emoji.find(Regexp.last_match[1].intern) ? '' : sym.to_s
    end
  end
end
