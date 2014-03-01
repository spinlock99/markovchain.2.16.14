require 'open-uri'

class MarkovChain
  attr_reader :text
  attr_reader :words

  def text=(url)
    @text = open(url, &:read)
    @words = Hash.new
    @text.split.each_cons(2) do |word, next_word|
      add(word, next_word)
    end
  end

  alias :initialize :text=

  private

  def add(word, next_word)
    if @words.include?(word) && @words[word].include?(next_word)
      @words[word][next_word] += 1
    elsif @words.include?(word)
      @words[word].merge!({next_word => 1})
    else
      @words[word] = {next_word => 1}
    end
  end
end
