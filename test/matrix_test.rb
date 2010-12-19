require File.join File.dirname(__FILE__), 'helper'

class MatrixTest < Test::Unit::TestCase
  def setup
    @values = { :rep => { :male => 200, :female => 250 }, :dem => { :male => 150, :female => 300}, :ind => { :male => 50, :female => 50 }}
  end

  def test_matrix_creation
    assert_raise ABAnalyzer::MatrixFormatError do 
      ABAnalyzer::Matrix.new({ :one => { :a => 10, :b => 20 }, :two => { :a => 5 } })
    end
  end

  def test_matrix_functions
    m = ABAnalyzer::Matrix.new @values
    assert_equal m.get(:rep, :male), 200
    assert_equal m.column_sum(:rep), 450
    assert_equal m.row_sum(:male), 400
    assert_equal m.total_sum, 1000
  end
end
