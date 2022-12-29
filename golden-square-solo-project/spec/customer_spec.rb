require 'customer'

RSpec.describe Customer do
  context 'When constructing a customer' do
    it 'should return name, address and mobile' do
      customer = Customer.new('Jim Bob', '1 First St', '+447777111222')
      expect(customer.full_name).to eq 'Jim Bob'
      expect(customer.address).to eq '1 First St'
      expect(customer.mobile).to eq '+447777111222'
    end
  end
end