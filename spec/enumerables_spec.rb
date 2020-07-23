require './enumerables.rb'

describe 'Enumerable' do

  let(:num_array) { [2,3,4,5,6,7,8,5,5] }
  let(:empty_array) { [] }
  let(:word_array) { ["Sharon", "Lea", "Leila", "Brian", "Arun"] }
  let(:name_hash) {{ name: 'kedir', last: 'Abdu' }}
  describe '#my_each' do
    
    context 'If block is not given' do
      it 'returns an enumerator' do
        expect(num_array.my_each.is_a?(Enumerable)).not_to be false
      end
    end

    context 'If a block is given' do
      it 'it squares each number in the array' do
        custom_array = []
        test_array = []
        num_array.my_each { |i| custom_array << i ** 2 }
        num_array.each { |i| test_array << i ** 2 }
        expect(test_array).to eql(custom_array)
      end


      it "it prints the contents of the hash" do
        custom_hash = []
        test_hash = []

        name_hash.my_each { |k, v| custom_hash << [k.to_s, v.upcase]}
        name_hash.each { |k, v| test_hash << [k.to_s, v.upcase]}
        expect(test_hash).to eql(custom_hash)
      end
    
    end
  end
 
  describe '#my_each_with_index' do
    let(:arr){%w(cat dog wombat)} 
    
   it "should behave as each_with_index" do
        hash_1 = Hash.new
        hash_2 = Hash.new
        arr.each_with_index { |item, index|
          hash_1[item] = index
        }
        arr.my_each_with_index { |item, index|
          hash_2[item] = index
        }
        expect(hash_1).to eql(hash_2)
    end

  end

 describe '#my_map' do
   
  # context 'If block is not given' do 
  #   expect(word_array.my_map.is_a?(Enumerable)).not_to be false
  # end
  
  context 'If a block is given' do 
    it "transforms to uppercase"do
      custom_array = []
      test_array = []
      num_array.my_map { |i| custom_array << i ** 2 }
      num_array.map { |i| test_array << i ** 2 }
      expect(test_array).to eql(custom_array)
    end

    it "it prints the contents of the hash" do
      custom_hash = []
      test_hash = []

      name_hash.my_map { |k, v| custom_hash << [k.to_s, v.upcase]}
      name_hash.map { |k, v| test_hash << [k.to_s, v.upcase]}
      expect(test_hash).to eql(custom_hash)
    end
  end
 end

 describe "#my_select" do
  context "If block is given" do
    it "select all but brian" do
      test_array = word_array.my_select { |friend| friend != "Brian" }
      custom_array = word_array.select { |friend| friend != "Brian" }
      expect(test_array).to eql(custom_array)
    end
    it "drops all odd numbers" do
      test_array = num_array.my_select{|num| num.even?}
      custom_array = num_array.select{|num| num.even?}
      expect(test_array).to eql(custom_array)
    end
    it "selects abdu" do
      test_array = name_hash.my_select{|k,v| v == 'Abdu'}
      custom_array = name_hash.select{|k,v| v == 'Abdu'}
      expect(test_array).to eql(custom_array)
    end
  end
 end

  describe "#my_all?" do
    context "If no block and no argument given  " do
      it "returns all true if all element in the array are truthy" do
        test_array = num_array.my_all?
        custom_array = num_array.all?
        expect(test_array).to eql(custom_array)
      end
    end
    context "If no block given with an argument  " do
      it "return true if all elements are of same class as the argument" do
        test_array = num_array.my_all?(Integer)
        custom_array = num_array.all?(Integer)
        expect(test_array).to eql(custom_array)
      end
      it "returns true if the every element in the array has the letter a in it" do
        test_array = word_array.my_all?(/a/)
        custom_array = word_array.all?(/a/)
        expect(test_array).to eql(custom_array)
      end
    end

    context "If block is given" do
      it "Runs every element through the block returns true if all elemets are true " do
        test_array = num_array.my_all? { |el| el < 1 }
        custom_array = num_array.all?  { |el| el < 1 }
        expect(test_array).to eql(custom_array)
      end
    end

    describe "#my_any?" do
      context "If no block and no argument given  " do
        it "returns all true if all element in the array are truthy" do
          test_array = num_array.my_any?
          custom_array = num_array.any?
          expect(test_array).to eql(custom_array)
        end
      end
      context "If no block given with an argument  " do
        it "return true if all elements are of same class as the argument" do
          test_array = num_array.my_any?(Integer)
          custom_array = num_array.any?(Integer)
          expect(test_array).to eql(custom_array)
        end
        it "returns true if the every element in the array has the letter a in it" do
          test_array = word_array.my_any?(/a/)
          custom_array = word_array.any?(/a/)
          expect(test_array).to eql(custom_array)
        end
      end
    
      context "If block is given" do
        it "Runs every element through the block returns true if all elemets are true " do
          test_array = num_array.my_any? { |el| el > 1 }
          custom_array = num_array.any?  { |el| el > 1 }
          expect(test_array).to eql(custom_array)
        end
      end
    end
  end

  describe "#my_any?" do
    context "If no block and no argument given  " do
      it "returns all true if all element in the array are truthy" do
        test_array = num_array.my_any?
        custom_array = num_array.any?
        expect(test_array).to eql(custom_array)
      end
    end
    context "If no block given with an argument  " do
      it "return true if all elements are of same class as the argument" do
        test_array = num_array.my_any?(Integer)
        custom_array = num_array.any?(Integer)
        expect(test_array).to eql(custom_array)
      end
      it "returns true if the every element in the array has the letter a in it" do
        test_array = word_array.my_any?(/a/)
        custom_array = word_array.any?(/a/)
        expect(test_array).to eql(custom_array)
      end
    end

    context "If block is given" do
      it "Runs every element through the block returns true if all elemets are true " do
        test_array = num_array.my_any? { |el| el > 1 }
        custom_array = num_array.any?  { |el| el > 1 }
        expect(test_array).to eql(custom_array)
      end
    end
  end 

 describe "#my_none?" do
  context "If no block and no argument given  " do
    it "returns all true if all element in the array are truthy" do
      test_array = num_array.my_none?
      custom_array = num_array.none?
      expect(test_array).to eql(custom_array)
    end
  end
  context "If no block given with an argument  " do
    it "return true if all elements are of same class as the argument" do
      test_array = num_array.my_none?(Integer)
      custom_array = num_array.none?(Integer)
      expect(test_array).to eql(custom_array)
    end
    it "returns true if the every element in the array has the letter a in it" do
      test_array = word_array.my_none?(/a/)
      custom_array = word_array.none?(/a/)
      expect(test_array).to eql(custom_array)
    end
  end

  context "If block is given" do
    it "Runs every element through the block returns true if all elemets are true " do
      test_array = num_array.my_none? { |el| el < 1 }
      custom_array = num_array.none?  { |el| el < 1 }
      expect(test_array).to eql(custom_array)
    end
  end
 end

 describe "#my_count" do
  context "if no block is given" do
    it "Count all the elements in the given array" do
      test_array = num_array.my_count 
      custom_array = num_array.count
      expect(test_array).to eql(custom_array)
    end
    it "counts the elements in the array that are equal to the argument" do
      test_array = num_array.my_count(5)
      custom_array = num_array.count(5)
      expect(test_array).to eql(custom_array)
    end
    
  end
  context "if block is given" do
    it "Count all the elements in the array that return true in the block" do
      test_array = word_array.my_count{ |s| s == s.upcase }
      custom_array = word_array.count{ |s| s == s.upcase }
      expect(test_array).to eql(custom_array)
    end
    it "Count all the elements in the array that return true in the block" do
      test_array = num_array.my_count(&:even?)
      custom_array = num_array.count(&:even?)
      expect(test_array).to eql(custom_array)
    end
  end



 end


end
