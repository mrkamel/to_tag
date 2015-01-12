# encoding: utf-8

require "test/unit"

require File.expand_path("../../lib/to_tag", __FILE__)

class ToTagTest < Test::Unit::TestCase
  def test_to_tag
    assert_equal "", ",.;&=?*+!'\"()|-".to_tag
    assert_equal "test", " test ".to_tag
    assert_equal "äöü", "ÄÖÜ".to_tags
  end 

  def test_to_tags
    assert_equal "", ",.;&=?*+!'".to_tags
    assert_equal "()\"-", "()\"-".to_tags
    assert_equal "test1 test2", "test1-test2".to_tags
    assert_equal "test1 -test2", "test1 -test2".to_tags
    assert_equal "3", 3.to_tag
    assert_equal "[1 2 3]", [1, 2, 3].to_tags

    assert_equal "test test", "test-test".to_tags
    assert_equal "(-test)", "(-test)".to_tags
    assert_equal "(test-)", "(test-)".to_tags
    assert_equal "-test", "-test".to_tags
  end 

  def test_to_ascii_tag
    assert_equal "aeoeue", "ÄÖÜ".to_ascii_tag
  end

  def test_to_ascii_tags
    assert_equal "aeoeue aeoeue", "ÄÖÜ ÄÖÜ".to_ascii_tags
  end
end

