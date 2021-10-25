class Calculate
    def self.random_prime(num_digits)
        attempted_prime = rand(10**(num_digits-1)...10 ** digits)
        until self.fermat_prime?(attempted_prime)
          attempted_prime = rand(10**(num_digits-1)...10 ** digits)
        end
        attempted_prime 
     end
 
     def self.pass_fermat_test?(p)
        a = rand(2000...3000)
        a.pow(p,p) == a % p
     end
 
     def self.prime?(num)
        return true if num == 2
        return false if num == 1
        (2..num **0.5).each {|int| return false if num % int == 0}
        return true 
     end 
     
     def self.fermat_prime?(p,tries = 20) 
        return false if p == 1
        return true if p == 2
        tries.times {return false if !self.pass_fermat_test?(p)}
        true
     end 
 
     def self.phi_n(factor_1,factor_2)
         (factor_1 - 1) * (factor_2 - 1)
     end
 
     def self.egcd(a,b)
       return a if b == 0      
       egcd(b, a % b)
     end
 
    def self.modinv(a, m) # compute a^-1 mod m if possible
        raise "NO INVERSE - #{a} and #{m} not coprime" unless a.gcd(m) == 1
        return m if m == 1
        m0, inv, x0 = m, 1, 0
        while a > 1
            inv -= (a / m) * x0
            a, m = m, a % m
            inv, x0 = x0, inv
        end
        inv += m0 if inv < 0
        inv
    end
end    

