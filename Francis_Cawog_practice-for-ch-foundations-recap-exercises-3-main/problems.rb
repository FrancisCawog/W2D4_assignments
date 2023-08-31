def no_dupes?(arr)
    count = Hash.new(0)
    arr.each do |ele|
        count[ele] += 1
    end
    count.keys.select {|ele| count[ele] == 1 }
end

def no_consecutive_repeats?(arr)
    arr.each_with_index do |ele, i|
        return false if arr[i] == arr[i+1]
    end
    true
end

def char_indices(str)
    hash = Hash.new {|h, k| h[k] = []}

    str.each_char.with_index do |char, i|
        hash[char] << i
    end
    hash
end

def longest_streak(str)
    current_string = ''
    longest_string = ''

    (0...str.length).each do |i|
        if str[i] == str[i-1] 
            current_string += str[i]
        else 
            current_string = str[i]
        end

        if current_string.length >= longest_string.length
            longest_string = current_string
        end
    end
    longest_string
end

def bi_prime?(num)
    arr = []
    (2...num).each do |fac|
        arr << fac if num % fac == 0
    end

    arr.length == 1 || arr.length == 2
end

def vigenere_cipher(word,keys)
    new_word = []
    alpha = ("a".."z").to_a

    word.split("").each_with_index do |let, i|
        old_pos = alpha.index(let)
        new_pos = old_pos + keys[i % keys.length]
        new_word << alpha[new_pos % 26]
    end
    new_word.join("")
end

def vowel_rotate(str)
    vowels = 'aeiou'
    last_vowel = str.split("").reverse.find {|char|vowels.include?(char)}
    new_vowel = ''

    new_word = []
    str.split("").each do |char|
        if vowels.include?(char)
            new_vowel = char
            char = last_vowel
            last_vowel = new_vowel
            new_word << char
        else
            new_word << char
        end
    end
    new_word.join("")
end

class String
    def select(&prc)
        return " " if prc.nil?
        new_str = ''

        self.each_char do |char|
            new_str += char if prc.call(char)
        end
        new_str
    end

    def map!(&prc)
        self.each_char.with_index {|char, i| self[i] = prc.call(char, i)}
    end
end

def multiply(a,b)
    return 0 if b == 0
    if b > 0
        return a + multiply(a, b - 1)
    else
        return -(a + multiply(a, (-b) - 1))
    end 
end
 
def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2,1] if num == 2

    prev = lucas_sequence(num - 1)
    next_el = prev[-1] + prev[-2]
    prev << next_el
    prev
end

def prime_factorization(num)
    (2...num).each do |factor|
        if num % factor == 0
            other_fac = num / factor
            return [*prime_factorization(factor), *prime_factorization(other_fac)]
        end
    end
    [num]
end