require 'track'

RSpec.describe Track do
  context 'Matching a track with a valid title and artist' do
    track_1 = Track.new('Bad Medicine', 'Jon Bon Jovi')
    it 'should return return true' do
      expect(track_1.matches?('medicine')).to eq true
    end
    it 'should return return false' do
      expect(track_1.matches?('apples')).to eq false
    end
    it 'should return return true' do
      expect(track_1.matches?('JON')).to eq true
    end
    it 'should return return false' do
      expect(track_1.matches?('Tom')).to eq false
    end
  end
  context 'When passing invalid title and/or artist' do
    it 'should raise and error: Invalid title or artist' do
      expect {Track.new('', '')}.to raise_error 'Invalid title or artist'
    end
    it 'should raise and error: Invalid title or artist' do
      expect {Track.new('', 'James')}.to raise_error 'Invalid title or artist'
    end
    it 'should raise and error: Invalid title or artist' do
      expect {Track.new('Best song in the world', '')}.to raise_error 'Invalid title or artist'
    end
    it 'should raise and error: Invalid title or artist' do
      expect {Track.new('', 2)}.to raise_error 'Invalid title or artist'
    end
    it 'should raise and error: Invalid title or artist' do
      expect {Track.new(true, '')}.to raise_error 'Invalid title or artist'
    end
  end
end
