require File.join File.dirname(__FILE__), 'helper'

class ABTestTest < Test::Unit::TestCase
  def setup
    @values = { :rep => { :male => 200, :female => 250 }, :dem => { :male => 150, :female => 300}, :ind => { :male => 50, :female => 50 }}
  end

  def test_test_creation
    assert_raise ABAnalyzer::InsufficientDataError do 
      m = ABAnalyzer::ABTest.new({ :one => { :a => 10, :b => 20 }, :two => { :a => 5, :b => 0 } })
      p = m.gtest_p
    end

    assert_raise ABAnalyzer::InsufficientDataError do 
      m = ABAnalyzer::ABTest.new({ :one => { :a => 1, :b => 1 }, :two => { :a => 1, :b => 1 } })
      p = m.gtest_p
    end
  end

  def test_matrix_functions
    m = ABAnalyzer::Matrix.new @values
    assert_equal 1, 1
  end
end
