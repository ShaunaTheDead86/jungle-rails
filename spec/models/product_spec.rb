require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create a new empty product object' do
      @product = Product.new
      expect(@product).to be_instance_of(Product)
    end

    it 'should create a new product object with parameters' do
      @product = Product.new(:name => "Bookshelf")
      expect(@product).to have_attributes(:name => "Bookshelf")
    end

    it 'should validate name' do
      @product = Product.new(:name => "Bookshelf")
      expect(@product).to have_attributes(:name => "Bookshelf")
    end

    it 'should validate price' do
      @product = Product.new(:price => 1986)
      expect(@product).to have_attributes(:price => 1986)
    end

    it 'should validate quantity' do
      @product = Product.new(:quantity => 19)
      expect(@product).to have_attributes(:quantity => 19)
    end

    it 'should validate category' do
      @category = Category.new(:id => 1)
      @product = Product.new(:category_id => @category.id)
      expect(@product).to have_attributes(:category_id => 1)
    end

    it 'should correctly throw an error if fiels are nil' do
      @category = Category.new(:id => 1, :name => "Apparrel")
      @product = Product.new(:name => "bookshelf", :price => 1986, :quantity => 19, :category_id => @category.id)

      expect(@product).to_not have_attributes(:name => nil)
      expect(@product).to_not have_attributes(:price => nil)
      expect(@product).to_not have_attributes(:quantity => nil)
      expect(@product).to_not have_attributes(:category_id => nil)
    end
  end
end
