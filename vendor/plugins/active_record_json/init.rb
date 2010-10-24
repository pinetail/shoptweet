class ActiveRecord::Base

  def to_json

    self.class.columns.inject([]) do |array, column|

        array << %Q|"#{column.name}" : "#{read_attribute(column.name)}"|

        array

    end.join(',')

  end

end

