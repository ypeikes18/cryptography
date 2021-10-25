class EllipticCurve
  
  def self.dot(point_1,point_2)

  end
  
  def self.multiply(point,times)
    
  end  

  def initialize(a,b,c,modulus) #y ** 2 (mod modulus) = a * (x ** 3) + b * x + c (mod modulus)
    @a = a
    @b = b
    @c = c
    @modulus = modulus
  end

  attr_reader :modulus, :a, :b ,:c

  def add_points(point_1, point_2) #takes in 2 arrays each containing an x,y coordinate pair
    
  end
  
  def point_on_curve?(point) 
    x, y = point[0], point[1]
    (y ** 2)  == (a *  x ** 3 + b * x + c) % modulus
  end   

  def get_y_coord(x)
    (a *  x ** 3 + b * x + c) % modulus
  end  

end    

c = EllipticCurve.new(1,-7, 10, 97)

