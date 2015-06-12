module Rumoji
  def erase(str)
    str.gsub(/:([^s:]?[\w-]+):/) {|sym| Emoji.find($1.intern) ? "" : sym.to_s }
  end
end
