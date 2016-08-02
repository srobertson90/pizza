require ('minitest/autorun')
require ('minitest/rg')
require('pry-byebug')
require_relative ('../models/sales')
require_relative ('../models/pizza')

class TestSales < MiniTest::Test

  def setup()
    @pizza1 = Pizza.new({
      'first_name' => 'Val',
      'second_name' => 'Gibson',
      'topping' => 'calzone',
      'quantity' => 4
      })
    @pizza2 = Pizza.new({
      'first_name' => 'Jay',
      'second_name' => 'Chetty',
      'topping' => 'meat',
      'quantity' => 2
      })
    @sales = Sales.new ([@pizza1, @pizza2])
  end

  def test_total_revenue
    result = @sales.total_revenue()
    assert_equal(60, result)
  end

  def test_delete
    @pizza2.delete()
# binding.pry
# nil
  end

  def test_update
    @pizza1.update("last_name", "Gibbles")
    binding.pry
    nil
  end
end