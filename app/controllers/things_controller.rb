class ThingsController < ApplicationController
  def index
    @data = (1..10).to_a
    @uid = MyWorker.async_do_something_fun(:data => @data)
  end
  
  def progress
    respond_to do |wants|
      wants.js do
        render :update do |page|
          @progress = Workling.return.get(params[:uid])
          if @progress == 'DONE'
            page << "periodical.stop()"
            page["status-message"].innerHTML = "Done!"
          else
            percent = ((@progress.to_f/params[:size].to_f)*100).to_i
            page['percentage'].innerHTML = "#{percent}%"
            page['progress'].setStyle("width:#{percent}%;") 
          end
        end
      end
    end
  end
end