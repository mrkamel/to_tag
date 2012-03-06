require "to_tag/version"
require "rubygems"
require "to_ascii"

# transform words into tags and multiple words (with operators, possibly)
# into multiple tags without loosing the operators

# operators: -word, "word", word1 | word2, (word1 | word2) word3

class Object
  # transform word into tag
  # remove special characters and operators

  def to_tag
    to_s.to_ascii.downcase.gsub(/[,.;&=?*+!'"()|-]/, " ").gsub(/\s+/, " ").strip
  end 

  # transform words into tags, but keep operators

  def to_tags
    res = to_s.to_ascii.downcase.gsub(/[,.;&=?*+!']/, " ")

    # remove hyphens connecting words, but keep if used as operator

    2.times do
      res.gsub!(/[^\s()|-]-[^\s()|-]/) { |s| s.gsub(/-/, " ") }
    end 

    # remove unwanded whitespace

    res.gsub(/\s+/, " ").strip
  end 
end

