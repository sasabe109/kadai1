class EventpageController < ApplicationController
    def make_event
        @event=Event.new
    end

    def event_list            
    end

    def schedule 

    end
    
    def event_create
        @event.content=params[:content]
        @event.name=params[:name]
        @event.save
        if @event.Event_type    　　 　　#日付指定型のイベントならば
            redirect_to("/schedule")
        else                             #日程調整型
            redirect_to("/event_list")
        end
    end

end
