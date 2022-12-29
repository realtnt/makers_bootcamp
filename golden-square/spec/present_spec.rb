require 'present'

pressie = Present.new

RSpec.describe Present do
  context 'When contents have not been wrapped' do
    it 'should raise an error' do
      expect { pressie.unwrap }.to raise_error 'No contents have been wrapped.'
    end
  end

  context 'When contents are wrapped' do
    it 'should not return: stuff' do
      result = pressie.wrap('stuff')
      expect(result).to eq('stuff')
    end
  end

  context 'When trying to wrap wrapped content' do
    it 'should raise an error' do
      expect { pressie.wrap('more stuff') }.to raise_error 'A contents has already been wrapped.'
    end
  end

  context 'When unwrapping wrapped content' do
    it 'should return the contents' do
      result = pressie.unwrap
      expect(result).to eq('stuff')
    end
  end
end
