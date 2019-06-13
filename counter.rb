require_relative './document'

file = open('http://www.gutenberg.org/files/11/11-0.txt')
puts Document.new(file.read).formatted_word_counts
