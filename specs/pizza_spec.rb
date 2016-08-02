require ('minitest/autorun')
require ('minitest/rg')
require('pry-byebug')
require_relative('../models/pizza')


class TestPizza < MiniTest::Test

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
    @pizza3 = Pizza.new({
      'first_name' => 'Tony',
      'second_name' => 'Cant Remember',
      'topping' => 'cheese',
      'quantity' => 3
      })
  end

  def test_delete
    @pizza3.delete
    assert_equal(nil, @pizza3.first_name)
  end

  def test_delete_after_save
    @pizza3.save
    @pizza3.delete
    assert_equal(nil, @pizza3.id)
  end

  def test_update
    @pizza3.update("last_name", "Gibbles")
    assert_equal("Gibbles", @pizza3.last_name)
  end

  def test_update_after_save
    @pizza3.save
    @pizza3.update("last_name", "Gibbles")
    assert_equal("Gibbles", @pizza3.last_name)
    # @pizza3.delete
  end

  # def test_delete
  #   @pizza3.delete()
  #   # binding.pry
  #   # nil
  # end


end