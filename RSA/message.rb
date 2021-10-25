require_relative "Key_Pair.rb"

class Message
  
  def initialize(plaintext,key,modulus)
    @plaintext = plaintext
    @key = key
    @modulus = modulus
  end

  #message must have fewer ord characters than the length of the modulus to survive
  def chars_to_num 
    arr = @plaintext.split()
    arr.map! {|char| char.ord.to_s}
    arr.join.to_i
  end  

  def decrypt_num(nums,key,modulus)
    nums.pow(key,modulus)
  end  

  def encrypt_num(nums,key,modulus)
    nums.pow(key,modulus)
  end  

  def self.decrypt
  
  end  
end    

