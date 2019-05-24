class Proxy
 
    attr_reader :messages
   
    def initialize(target_object)
      @object = target_object
      @messages = []
    end
     
    def method_missing(method_name, *args, &block)
      @messages << method_name
      @object.send(method_name, *args, &block)
    end
       
    def called?(method_name)
      @messages.include?(method_name)
    end
     
    def number_of_times_called(method_name)
      @messages.count(method_name)
    end
     
  end
  
  class Television
    attr_accessor :channel, :on
    @on = 0
    
    def power
        if @power == :on
            @power = :off 
        else
            @power = :on
        end
      end

    def on?
        @power == :on
    end

  end

  
tv = Proxy.new(Television.new)

puts tv
puts Television

tv.channel = 10
tv.power
tv.power
tv.power

if tv.channel == 10
    puts "Channel == 10: true"
else
    puts "Channel == 10: false"
end

puts "TV ON: #{tv.on?}"

print tv.messages
print "\n"

puts "TV called? #{tv.called?(:xxx?)}"

puts "times method called? #{tv.number_of_times_called(:power)}"

diff_args = Proxy.new("Ruby is Coding")

print diff_args.split
print "\n"

print diff_args.messages