class Quote
  require 'json'
  attr_reader :start_time, :end_time, :text

  def initialize(start_time, end_time, text)
    @start_time = start_time
    @end_time = end_time
    @text = text
  end

  def to_json
    { "start_time" => start_time ,
      "end_time"   => end_time ,
      "text"       => text 
    }.to_json
  end
end

input = `curl http://new.outloudradio.org/sites/default/files/transcripts/Mothers%20Day%20outLoud.srt`
input = input.split("\r\n")

quotes = []

until input.empty?  
  block = input.shift(input.index("")) rescue input.shift(input.count) # for the last block
  caption_number = block[0]
  times = block[1].split(' --> ') 
  start_time = times[0] 
  end_time = times[1] 
  text = block[2..-1].join(' ') 
  quotes << Quote.new(start_time, end_time, text)
  separator = input.shift
end

puts "*"*10
puts "Number of quotes"
p quotes.count

puts "*"*10
puts "First quote"
p quotes.first

puts "*"*10
puts "Last quote"
p quotes.last

puts "*"*10
puts "Last quote to_json"
p quotes.last.to_json
