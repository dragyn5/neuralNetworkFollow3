require 'matrix'

class NeuralNetwork
  attr_accessor :output_layer_output
  def initialize(size2)
    @input_array = Vector[1,0]
  
    @nn2_biases = []
    @nn2_output = Vector.basis(size: size2,index: 1)
    @output_layer_biases = [randomNumber, randomNumber, randomNumber, randomNumber]
    @output_layer_output = Vector[1,1,1,1]
    size2.times do |x|
      @nn2_biases << randomNumber
    end
    
    @w1 = []
    @w2 = []
    size2.times do |x|
     @w1 << Vector[randomNumber, randomNumber]
    end
    
    w2initialization = []
    
    / needs refactored to allow dynamic hidden layer size/
    @output_layer_output.size.times do |x|
      @w2 << Vector[randomNumber, randomNumber, randomNumber]
    end
  end
  
  def calculateNN2
    current_output_array = []
    
    (@nn2_output.size).times do |x|
      current_output_array << sigmoid(@w1[x].inner_product(@input_array) + @nn2_biases[x])
    end
    
    / needs refactored /
    @nn2_output = Vector[current_output_array[0], current_output_array[1], current_output_array[2]]
  end
 
  def calculateNN3
    current_output_array = []
    (@output_layer_output.size).times do |x|
      @nn2_output
      current_output_array << sigmoid(@w2[x].inner_product(@nn2_output) + @output_layer_biases[x])
    end
    
    / needs refactored /
    @output_layer_output = Vector[current_output_array[0], current_output_array[1], current_output_array[2], current_output_array[3]]
  end
  
  def sigmoid(stuff)
    return 1/(1+2.7182818284590452353602874713527**(-stuff))
  end
  
  def randomNumber
    return rand(-1.0..1.0)
  end

end

nn = NeuralNetwork.new(3)
nn.calculateNN2
nn.calculateNN3
puts nn.output_layer_output
# a = Matrix[[1,3,-5],[2,5,3]]



