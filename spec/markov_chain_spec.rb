require 'spec_helper'
require 'markov_chain'

describe MarkovChain do
  let(:url) { 'http://www.gutenberg.org/cache/epub/45010/pg45010.txt' }

  describe '#new' do
    subject!(:markov_chain) { MarkovChain.new(url) }

    specify { expect { markov_chain }.to_not raise_exception }

    it 'reads the text from the url' do
      markov_chain.text[0,28].should match('The Project Gutenberg eBook')
    end

    it 'does things' do
      markov_chain.words.should eq('stuff')
    end
  end
end
