# frozen_string_literal: true

RSpec.describe "Kernel#with_defer" do
  it "add two methods to defer" do
    expect do
      with_defer do |defer|
        defer << -> { puts "First deferred task" }
        defer << -> { puts "Second deferred task" }
        puts "Main code execution"
      end.to output("Main code execution\nSecond deferred task\nFirst deferred task\n").to_stdout
    end
  end

  it "add two methods to defer with raise" do
    expect do
      with_defer do |defer|
        defer << -> { puts "First deferred task" }
        defer << -> { puts "Second deferred task" }
        puts "Main code execution"
        raise "An error occurred!" 
      end.to output("Main code execution\nSecond deferred task\nFirst deferred task\n").to_stdout
    end
  end

  it "multiply the number in the block" do
    num = 2

    with_defer do |defer|
      defer << -> { num *= num }
    end

    expect(num).to eq(4)
  end

  it "check the number before the end block" do
    num = 2

    with_defer do |defer|
      defer << -> { num *= num }

      expect(num).to eq(2)
    end
  end
end
