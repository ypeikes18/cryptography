require_relative "math.rb"
require "byebug"

class KeyPair
    
    def self.verify_sig(sig_array) 
        message, signature, public_key, modulus = sig_array
        signature.pow(public_key,modulus) == message  
    end    

    def initialize(digits_in_p, public_key = 65537)
        @p = Calculate.random_prime(digits_in_p) 
        @q = Calculate.random_prime(digits_in_p)
        @modulus = @p * @q
        @public_key = public_key
        @private_key = Calculate.modinv(@public_key,Calculate.phi_n(@p,@q))
    end

    attr_reader :public_key, :private_key, :modulus

    def sign_arr(num) #returns signature in an array in the form: [message,signature,public_key,modulus]
      signed_message = [num]
      signature = num.pow(@private_key,modulus)
      signed_message.push(signature,@public_key,@modulus)
    end    

    def sign_hash(num)
      hash = Hash.new
      hash["num"], hash["signature"] = num ,num.pow(private_key,modulus)
      hash["public_key"], hash["modulus"] = public_key, modulus
      hash
    end    
end

k = KeyPair.new(100)
s = k.sign_arr(155568685566565)
p k.sign_hash(200)
p KeyPair.verify_sig(s)
p k.private_key.to_s.length




