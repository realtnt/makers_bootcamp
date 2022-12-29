require 'exercise4'

RSpec.describe TimeError do
  it 'should return the time error' do
    requester_dbl = double :requester
    expect(requester_dbl).to receive(:get)
      .with(URI("https://worldtimeapi.org/api/ip"))
      .and_return(
        '{
          "abbreviation": "BST",
          "client_ip": "86.31.204.182",
          "datetime": "2022-05-06T13:28:17.903776+01:00",
          "day_of_week": 5,
          "day_of_year": 126,
          "dst": true,
          "dst_from": "2022-03-27T01:00:00+00:00",
          "dst_offset": 3600,
          "dst_until": "2022-10-30T01:00:00+00:00",
          "raw_offset": 0,
          "timezone": "Europe/London",
          "unixtime": 1651840097,
          "utc_datetime": "2022-05-06T12:28:17.903776+00:00",
          "utc_offset": "+01:00",
          "week_number": 18
        }'
      )
    
    server_time_fake = DateTime.parse("2022-05-06T12:28:17.903776+00:00").to_time
    computer_time_fake = DateTime.parse("2022-05-06 13:49:07.640458578 +0100").to_time

    time_dbl = double :time
    expect(time_dbl).to receive(:now)
      .and_return(computer_time_fake)

    time = TimeError.new(requester_dbl, time_dbl)
    expect(time.error).to eq server_time_fake - computer_time_fake
  end
end
