require('pry-byebug')
require('pg')

class Pizza

  attr_reader(:first_name, :last_name, :topping, :quantity, :id)

  def self.all()
    db = PG.connect({ dbname: 'pizza_shop', host: "localhost"})
    sql = "SELECT * FROM pizzas;"
    pizzas = db.exec(sql)
    db.close()
    # return pizzas
    # result = []
    # for pizza in pizzas do
    # pulled_pizza = Pizza.new (pizza)
    # result << pulled_pizza
    # end
    # return result
    pizza_objects =  pizzas.map { |properties| Pizza.new(properties)}
    return pizza_objects
  end

  def initialize(options)
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @topping = options["topping"]
    @quantity = options["quantity"].to_i
  @id = options['id'].to_i if options['id'] #convert to int if value given
end

def delete()
  if @id 
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
    sql = "DELETE FROM pizzas WHERE id = #{@id};"
    result = db.exec(sql)
    db.close()
  end
  @first_name = nil
  @last_name = nil
  @topping = nil
  @quantity = nil
  @id = nil
  return result
end

def update(field_name, updated_value)
  if @id 
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
    sql = "UPDATE pizzas SET #{field_name} = '#{updated_value}' WHERE id = #{@id};"
    result = db.exec(sql)
    db.close()
  end
 code = "@#{field_name} = '#{updated_value}'"
 eval(code)
return result
end

def save()
  db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
  sql = "INSERT INTO pizzas (
  first_name,
  last_name,
  topping,
  quantity
  ) VALUES (
  '#{first_name}',
  '#{last_name}',
  '#{topping}',
  '#{quantity}'
  ) returning *;
  "
  result = db.exec(sql)
  @id = result[0]['id']
  db.close()
end


# p = Pizza.new({
#   "first_name" => "Tony",
#   "last_name" => "Eusabio",
#   "topping" => "haggis", 
#   "quantity" => 1
#   })


# pizza1 = Pizza.new({
#   "first_name" => "Tony",
#   "last_name" => "Eusabio",
#   "topping" => "haggis", 
#   "quantity" => 1
#   })


# pizza2 = Pizza.new({
#   "first_name" => "Valerie",
#   "last_name" => "Gibson",
#   "topping" => "meat feast", 
#   "quantity" => 2
#   })

# pizza1.save
# pizza2.save



# binding.pry
# nil
end