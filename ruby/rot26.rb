# Ruby rot26 implementation
# by ArmoredStone
# 24.01.2025

def rotate_char(input_char, mode)
    shift = 26
    if mode == 'left'
        return (input_char.ord - shift).chr
    elsif mode == 'right'
        return (input_char.ord + shift).chr
    else
        puts "Usage: ruby rot26.rb [left|right] [string]"
        exit
    end
end

def rotate_string(input_string, mode)
    return input_string.chars.map { |c| rotate_char(c, mode) }.join
end

if ARGV.length != 2
    puts "Usage: ruby rot26.rb [left|right] [string]"
    exit
end

mode = ARGV[0]
string = ARGV[1]

unless ['left', 'right'].include?(mode)
    puts "Usage: ruby rot26.rb [left|right] [string]"
    exit
end

if string.nil?
    puts "Usage: ruby rot26.rb [left|right] [string]"
    exit
end

result = rotate_string(string, mode)
puts result
