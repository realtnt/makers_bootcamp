require 'challenge_4'

RSpec.describe CatFacts do
  it 'should return a cat fact' do
    requester_dbl = double :requester
    expect(requester_dbl).to receive(:get)
      .with(URI("https://catfact.ninja/fact"))
      .and_return(
        '{
          "fact": "Cats lived with soldiers in trenches, where they killed mice during World War I.",
          "length": 80
        }'
      )
    cat_fact = CatFacts.new(requester_dbl)
    expect(cat_fact.provide).to eq 'Cat fact: Cats lived with soldiers in trenches, where they killed mice during World War I.'
  end
end