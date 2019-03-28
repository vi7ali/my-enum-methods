require './lib/my_enum_methods'

RSpec.describe "My_enum_methods" do
  describe "#my_each" do
    it "Applies a block to each element" do
      test = []
      [1,2,3].my_each {|n| test.push(n+1)}
      expect(test).to eql([2,3,4])
    end

    it "Returns self" do
      test = [1,2,3]      
      test.my_each {|n| n+10}
      expect(test).to eql([1,2,3])
    end
  end

  describe "#each_with_index" do
    it "Applies a block to each element and provides an index" do
      test = {}
      ["one", "two", "three"].my_each_with_index {|n, i| test[n.to_sym] = i}      
      expect(test).to eql({one: 0, two: 1, three: 2})
    end

    it "Returns self" do
      test = [1,2,3]
      test.my_each_with_index {|n, i| n += i}      
      expect(test).to eql([1,2,3])
    end
  end

  describe "#my_select" do
    it "Returns the elements for which the provided block returns true" do
      test = [1,2,3,4]
      expect(test.my_select{|n| n%2 == 0}).to eql([2,4])
    end
  end

  describe "#my_all?" do
    it "Returns true if all the elements pass the condition in the block, otherwise false" do
      test = [1,"2",3]
      expect(test.my_all?{|n| n.is_a?(Integer)}).to_not eql(true)
    end
  end

  describe "#my_none?" do
    it "Returns true if all the elements do not pass the condition in the block, otherwise true" do
      test = ["1","2","3"]
      expect(test.my_none?{|n| n.is_a?(Integer)}).to eql(true)
    end
  end

  describe "#my_map?" do
    it "Returns a new array of elements with the block applied to each element" do
      test = [1,2,3,10]
      expect(test.my_map{|n| n+=5}).to eql([6,7,8,15])
    end
  end

end