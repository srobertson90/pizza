class Sales

def initialize(pizzas)
@pizzas = pizzas
end

def total_revenue()
# @pizzas.each { |pizza| total += (pizza.quantity * 10)}
@pizzas.inject(0) {|total, pizza| total + (pizza.quantity*10)}
end


end