class EventpageController < ApplicationController
    def make_event
        
    end

    def create
        @event=Event.new(title: params[:title])
        @event.title=params[:title]
        @event.content=params[:content]
        @event.date=params[:date]
        @event.save
        if @event.date                   #日付指定型のイベントならば
            redirect_to("/schedule")
        else                             #日程調整型
            redirect_to("/event_list")
        end
    end

    def event_list            
    end

    def schedule 
    end

    def show_event
       @event=Event.find_by(id:params[:id])
    end

    def edit_event
        @event=Event.find_by(id:params[:id])
    end

    def recreate                          #修正
        
    end
    
    
end
