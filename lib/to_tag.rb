
require "to_tag/version"
require "rubygems"
require "to_ascii"
require "unicode"

class Object
  def to_unicode_tag
    Unicode.downcase(to_s).gsub(/[,.;&=?*+!'"()|-]/, " ").gsub(/\s+/, " ").strip
  end

  def to_ascii_tag
    to_s.to_ascii.to_unicode_tag
  end

  alias :to_tag :to_ascii_tag

  def to_unicode_tags
    res = Unicode.downcase(to_s).gsub(/[,.;&=?*+!']/, " ")

    2.times do
      res.gsub!(/[^\s()|-]-[^\s()|-]/) { |s| s.gsub(/-/, " ") }
    end 

    res.gsub(/\s+/, " ").strip
  end 

  def to_ascii_tags
    to_s.to_ascii.to_unicode_tags
  end

  alias :to_tags :to_ascii_tags
end

