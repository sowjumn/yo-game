class Table

  def initialize(table_name, cols)
    @table_name = table_name
    @cols = cols
    @rows = []
  end

  def insert(vals)
    @rows.push(vals)
  end

  def select(query=[])
    output = []
    #--> n
    @rows.each do |r|
      r_select = true
      query.each do |k,v|
        if r[k] != v
          r_select = false
        end
      end
      output.push(r) if r_select
    end
    output
  end

  def delete(query)
    rows_to_delete = []
    @rows.each do |r|
      r_select = true
      query.each do |k,v|
        if r[k] != v
          r_select = false
        end
      end
      rows_to_delete.push(r) if r_select
    end
    @rows = @rows - rows_to_delete 
    rows_to_delete.length
  end
end


dogs = Table.new('dogs',['name', 'breed', 'fuzz'])
dogs.insert({'name' =>  'Fred', 'breed' =>  'Border Collie', 'fuzz' => 6})
dogs.insert({'name' =>  'Fuzzball', 'breed' =>  'Border Collie', 'fuzz' => 9})
dogs.insert({'name' =>  'Clifford', 'breed' =>  'Big Red', 'fuzz' => 1})

puts dogs.select();
puts '________________'
puts dogs.select({'breed' => 'Big Red'})
puts '________________'
puts dogs.select({'breed' => 'Border Collie', 'name' => 'Fred' })
puts '________________'
puts dogs.select({'breed' => 'Border Collie'})
puts '_________________'
puts dogs.delete('name' => 'Clifford')
puts '____________'
puts dogs.select('name' => 'Clifford')


