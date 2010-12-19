module ABAnalyzer

  class Matrix
    attr_reader :columns, :rows
    def initialize(values)
      @values = values
      @columns = values.keys
      @rows = values[@columns.first].keys
      validate
    end

    def validate
      @values.each { |colname, column|
        if column.keys.map { |s| s.to_s }.sort != @rows.map { |s| s.to_s }.sort
          raise MatrixFormatError, "Column #{colname} has row names that don't match the first column's."
        end
      }
      coltotal = @columns.map { |col| column_sum(col) }.inject { |a,b| a+b }
      rowtotal = @rows.map { |col| row_sum(col) }.inject { |a,b| a+b }
      raise MatrixFormatError, "Column sums do not equal row sums" if coltotal != rowtotal
    end

    def get_column(name)
      @values[name].values
    end

    def get_row(name)
      @values.map { |colname, rows|
        rows[name]
      }
    end

    def each_cell
      @columns.each { |colname|
        @rows.each { |rowname|
          yield colname, rowname, get(colname, rowname)
        }
      }
    end

    def get(colname, rowname)
      @values[colname][rowname]
    end

    def column_sum(name)
      get_column(name).inject { |a,b| a+b }
    end

    def row_sum(name)
      get_row(name).inject { |a,b| a+b }
    end

    def total_sum
      @columns.map { |col| column_sum(col) }.inject { |a,b| a+b }      
    end
  end

end
