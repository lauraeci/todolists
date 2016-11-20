require_relative '../config/environment'

describe BinaryTree do
  context 'Creating a new binary tree' do
    it 'should initialize a new binary tree' do
      b = BinaryTree.new
      expect(b).to be_truthy
      expect(b.is_empty()).to be_truthy
    end

    it 'should perform insertions' do
      b = BinaryTree.new
      x = 5
      b.insert(x)
    end

    it 'should get the max' do
      b = BinaryTree.new
      x = 5
      b.insert(x)
      expect(b.find_max()).to eq(5)
    end

    it 'short get the min' do
      b = BinaryTree.new
      x = 5
      b.insert(x)
      x = 2
      b.insert(x)
      expect(b.find_min()).to eq(2)
    end
  end
end
