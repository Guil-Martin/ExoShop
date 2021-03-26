require "spec_helper"
require "greeting"

RSpec.describe Greeting do
    greeting = described_class.new
    describe "#hello" do
        it "return 'Hello World'" do        
            expect(greeting.hello).to eql("Hello World")
        end
    end
    describe "#Goodbye" do
        it "return 'Goodbye'" do
            expect(greeting.goodbye).to eql("Goodbye World")
        end
    end
end