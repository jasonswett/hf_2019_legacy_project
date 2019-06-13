require 'open-uri'
require 'pry'

class Document
  DOT_PADDING = 3

  def initialize(text)
    @words = text.gsub(/-/, ' ').split
  end

  def words
    @words.map do |word|
      word.gsub!(/[,\?\.‘’“”\:;!\(\)]/, '')
      word.downcase
    end
  end

  def word_counts
    words.inject(Hash.new(0)) do |total, word|
      total[word] += 1
      total
    end
  end

  def sorted_word_counts
    word_counts.sort_by do |_, word_count|
      word_count
    end.to_h
  end

  def word_with_dots(word, word_count, length_of_longest_word)
    digit_count = word_count.to_s.length
    word.ljust(length_of_longest_word + DOT_PADDING - digit_count, '.')
  end

  def formatted_word_counts
    length_of_longest_word = words.max_by(&:length).length

    sorted_word_counts.map do |word, word_count|
      "#{word_with_dots(word, word_count, length_of_longest_word)}#{word_count}"
    end
  end
end
