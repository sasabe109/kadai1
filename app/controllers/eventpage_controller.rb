class EventpageController < ApplicationController
    before_action :authenticate_user!        #アクセス制限レベル１  ログイン画面へリダイレクト

    def make_event
    end

    def create
        @event=Event.new(title: params[:title])
        @event.title=params[:title]
        @event.content=params[:content]
        @event.date=params[:date]
        @event.presenter_id=current_user.id
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
       num=@event.presenter_id
       @user=User.find_by(id:num)
    end

    def edit_event
        @event=Event.find_by(id:params[:id])
    end

    def update                          #修正
        @event=Event.find_by(id: params[:id])
        @event.title=params[:title]
        @event.content=params[:content]
        @event.date=params[:date]
        @event.save               
        redirect_to("/schedule")   #日付指定型のイベントな
    end
    
    def destroy
        @event=Event.find_by(id: params[:id])
        @event.destroy
        redirect_to("/schedule")
    end
end
