
require "test/unit"

require File.expand_path("../../lib/to_tag", __FILE__)

class ToTagTest < Test::Unit::TestCase
  def test_to_tag
    assert_equal "", ",.;&=?*+!'\"()|-".to_tag
    assert_equal "test", " test ".to_tag
  end 

  def test_to_tags
    assert_equal "", ",.;&=?*+!'".to_tags
    assert_equal "()\"-", "()\"-".to_tags
    assert_equal "test1 test2", "test1-test2".to_tags
    assert_equal "test1 -test2", "test1 -test2".to_tags
    assert_equal "3", 3.to_tag
    assert_equal "123", [1, 2, 3].to_tags

    assert_equal "test test", "test-test".to_tags
    assert_equal "(-test)", "(-test)".to_tags
    assert_equal "(test-)", "(test-)".to_tags
    assert_equal "-test", "-test".to_tags
  end 
end

