# frozen_string_literal: true

# Does some stuff I guess
class Sample
  def initialize(vals)
    @arr = vals
  end

  def iterate(count, &block)
    0.upto(count).each(&block)
  end

  def self.show_regex(string, pattern)
    match = pattern.match(string)
    if match
      "#{match.pre_match}-> #{match} <-#{match.post_match}"
    else
      'no match'
    end
  end

  test = Sample.new(Array['test', 'more', 3])
  test.iterate(5) { |i| puts i }
  p(/te/.match('test').pre_match)
  p show_regex('thisisateststring', /[tase]/)
  p show_regex('testingtestingtesting', /(testing)??/)
  p 'this1is#STRing'.match(/[thing]/)
  p 'test  '.dup.chomp!(' ')
  p 5.upto(10).to_enum.inject(:+)
  p Sample.new(1)

  md = /(blue|red):(gr[ea]y)/.match('blue:gray')
  p show_regex('testtesttesttest', /(^.)(.*)($\1)/)
  md.each_with_index { |data, i| p "Group # #{i}: #{data}" }
end
