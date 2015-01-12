
require "to_tag/version"
require "rubygems"
require "unicode"
require "to_ascii"

class Object
  def to_tag
    Unicode.downcase(to_s).gsub(/[,.;&=?*+!'"()|-]/, " ").gsub(/\s+/, " ").strip
  end

  def to_ascii_tag
    to_s.to_ascii.to_tag
  end

  def to_tags
    res = Unicode.downcase(to_s).gsub(/[,.;&=?*+!']/, " ")

    2.times do
      res.gsub!(/[^\s()|-]-[^\s()|-]/) { |s| s.gsub(/-/, " ") }
    end 

    res.gsub(/\s+/, " ").strip
  end

  def to_ascii_tags
    to_s.to_ascii.to_tags
  end
end

