class MyWorker < Workling::Base
  
  def do_something_fun(options={})
    options[:data].each_with_index do |line,index|
      
      # Set the workling return store to index of the record you are processing
      Workling.return.set(options[:uid], index+1)
      
      #processing of the data in 'line' goes here
      sleep(1)
    end
    
    Workling.return.set(options[:uid], "DONE")
  end
end