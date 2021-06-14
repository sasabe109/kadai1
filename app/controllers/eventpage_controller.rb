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
        redirect_to("/schedule")
    end

    def event_list            
    end

    def schedule 
    end

    def show_event
       @event=Event.find_by(id:params[:id])
       num=@event.presenter_id
       @user=User.find_by(id:num)
       @join=Join.find_by(user_id: current_user.id , event_id: params[:id]) #追加部分
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
        Join.destroy_by(event_id:params[:id]) #削除前に全員脱退させる
        @event.destroy
        redirect_to("/schedule")
    end

    def join
        join=Join.new(user_id: current_user.id)
        join.event_id=params[:id]
        join.save
        redirect_to("/schedule")  #後に変更の可能性あり
    end

    def exit
        join=Join.find_by(user_id: current_user.id , event_id:params[:id])
        join.destroy
        redirect_to("/schedule")
    end

    def memberlist
        joins=Join.where(event_id: params[:id])
        @memberlists=[],i=0
        if joins.size>=2
                joins.each do |j|
                    @memberlists[i]=Event.find_by(id:j.user_id)
                    i+=1
                end
        elsif joins.size==1
            join=Join.find_by(event_id: params[:id])
            @memberlists=User.find_by(id:join.user_id)
        else
            @memberlists="まだ参加者はいません"
        end
    end

    def myevent
        myevents=Join.where(user_id: current_user.id)
        @myevents=[],i=0
        if myevents.size>=2
            myevents.each do |m|
                @myevents[i]=Event.find_by(id:m.event_id)
                i+=1
            end
        elsif myevents.size==1
            myevent=Join.find_by(user_id: current_user.id)
            @myevents=Event.find_by(id:myevent.event_id)
        else
            @myevents="まだ参加していません"
        end
    
    end

    def close
        @event=Event.find_by(id:params[:id])
        @event.flag="1"
        @event.save
        redirect_to("/schedule")
    end

    def result
        @event=Event.find_by(id:params[:id])
        start_day=@event.created_at 
        start_day=start_day.to_datetime
        end_day = start_day + 30.day
        @select_date=(start_day..end_day).to_a   #　datetime型の配列を定義
        @get_counts = Count.where(event_id:params[:id])   #指定のイベントに対するカウントテーブルの有無を確認
        if @get_counts.empty?                              #無ければ、そのイベントに対する集計テーブルを新作成し全て0を代入
            for i in 0..30 do
                @get_count=Count.new(event_id:params[:id] , datenum:i , user_count:0)
                @get_count.save
            end
            @get_counts=Count.where(event_id:params[:id])
        end
        @get_plans=Planning.where(event_id:params[:id],user_id:current_user.id)
    end

    def match_day
        @event=Event.find_by(id:params[:id])
        start_day=@event.created_at 
        start_day=start_day.to_datetime
        end_day = start_day + 30.day
        @select_date=(start_day..end_day).to_a   #　datetime型の配列を定義
        @get_plan=Planning.where(event_id:params[:id] , user_id:current_user.id)
    end

    def decide_date
        user_key=current_user.id 
        event_key=params[:id]

        i=0
        #各dateに対するstatusをセットでPlanningテーブルに受け渡し用の配列.each doで格納
        params[:datelist].each do | di1,di2 |
            @get_plan=Planning.new(user_id:user_key)
            @get_plan.event_id=event_key
            @get_plan.datenum=i
            @get_plan.strdate=di1 
            @get_plan.status=di2 
            @get_plan.save            #最後の２項で一意的なレコードが生成される
            i +=1 
        end 

        j=0
        params[:datelist].each do | di1,di2 |
            plan=Planning.find_by(event_id:event_key,datenum:j)
            if plan.status==1
                @count=Count.find_by(event_id:event_key , datenum:j)
                @count.user_count += 1
                @count.save
            end
            j += 1
        end
        redirect_to("/planning/result/#{params[:id]}")
    end


    def re_decide_date

        #チェックボックスの各statusとカウントテーブルの加算・非加算状態を初期化する
        user_plan=Planning.where(event_id:params[:id],user_id:current_user.id)
        count=Count.where(event_id:params[:id])
        m=0
        user_plan.each do |plan|
            if(plan.status==1)
                plan.status=0
                plan.save
                count[m].user_count -=1
                count[m].save
            end
            m +=1
        end

        i=0
        #各dateに対するstatusをセットでPlanningテーブルに受け渡し用の配列.each doで再設定
        params[:datelist].each do | di1,di2 |
            @get_plan=Planning.find_by(event_id:params[:id] , user_id:current_user.id ,datenum:i)
            @get_plan.status=di2 
            @get_plan.save            #最後の２項で一意的なレコードが生成される
            i +=1 
        end 

        j=0
        params[:datelist].each do | di1,di2 |
            plan=Planning.find_by(event_id:params[:id],datenum:j)
            if plan.status==1
                @count=Count.find_by(event_id:params[:id] , datenum:j)
                @count.user_count += 1
                @count.save
            end
            j += 1
        end
        redirect_to("/planning/result/#{params[:id]}")

    end 

end
