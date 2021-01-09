require 'pry'
require 'yaml'

def load_library(file)
  hash = YAML.load_file(file)
  
  hash.map do |key, value|
    hash[key] = {
      :english => value[0],
      :japanese => value[1]
    }
      
  end
  hash
end

def get_english_meaning(file, emoticon)
  hash = load_library(file)
  english_meaning = nil
  hash.each do |key, value|
    if hash[key][:japanese] == emoticon
      english_meaning = key
    end
  end
  english_meaning
end



def get_japanese_emoticon(file, emoticon)
  hash = load_library(file)
  japanese_emoticon = nil
  hash.each do |key, value|
    if hash[key][:english] == emoticon
      japanese_emoticon = hash[key][:japanese]
    end
  end
  japanese_emoticon    
end



