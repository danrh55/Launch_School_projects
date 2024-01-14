# def exists(str)
#   if str =~ /lab/
#     puts "it exists"
#   else
#     puts "no it does not"
#   end
# end

# exists('laboratory')
# exists('experiment')
# exists('Pans Labyrinth')
# exists('elaborate')
# exists('polar bear')

def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }