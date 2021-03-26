require "spec_helper"
require "product"
require "cart"

RSpec.describe Product do
    product = described_class.new
    cart = Cart.new
    describe "#Test result of multiple fruits" do
        it "return '580'" do
            product.entry("mele", cart)
            product.entry("apple", cart)
            product.entry("apple", cart)
            product.entry("pomme", cart)
            product.entry("apple", cart)
            product.entry("mele", cart)
            product.entry("cerise", cart)
            product.entry("cerise", cart)
            expect(cart.total).to eql(580)
        end
    end
end