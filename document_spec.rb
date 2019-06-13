require 'rspec'
require 'pry'
require_relative './document'

RSpec.describe Document do
  describe '#words' do
    it 'cleans up the words' do
      words = 'these, words! have punctuation.'
      document = Document.new(words)

      cleaned_words = [
        'these',
        'words',
        'have',
        'punctuation'
      ]

      expect(document.words).to eq(cleaned_words)
    end
  end

  describe '#formatted_word_counts' do
    it 'formats the word counts' do
      document = Document.new('hello world')
      expect(document.formatted_word_counts).to eq(["hello..1", "world..1"])
    end
  end

  describe '#sorted_word_counts' do
    it 'counts words' do
      document = Document.new('hello hello goodbye')
      word_counts = document.sorted_word_counts

      expect(word_counts['hello']).to eq(2)
      expect(word_counts['goodbye']).to eq(1)
    end

    it 'sorts the word counts' do
      document = Document.new('hello hello tacos tacos tacos goodbye')
      word_counts = document.sorted_word_counts

      expect(word_counts.keys.first).to eq('goodbye')
      expect(word_counts.keys.last).to eq('tacos')
    end
  end
end
