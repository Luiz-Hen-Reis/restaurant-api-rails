require 'rails_helper'

RSpec.describe Category, type: :model do

  describe "Validations" do
    it "is not valid without a name" do
      category = new_category(nil)
      expect(category).not_to be_valid
    end

    it "should be valid with name" do
      category = new_category("Entradas")
      expect(category).to be_valid
    end
  end

  describe "Associations" do
    it "should have many products" do
      association = described_class.reflect_on_association(:products)
      expect(association.macro).to eq :has_many
    end
  end

end

def new_category(name)
    category = Category.new(name: name)
end
