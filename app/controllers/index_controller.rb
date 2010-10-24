# -*- coding:utf-8 -*-
class IndexController < ApplicationController
  def main
#    timelines = Arel::Table.new(:timeliens)
#    users = Arel::Table.new(:users)

#    @timelines = timelines.join(users).take(10).to_sql
#    @timelines = Timeline.join(User).order("created_at desc").limit(10)
    if params[:keyword]
      conditions = ['text like ?', '%' + params[:keyword] + '%']
    else 
      conditions = ['']
    end

    @timelines = Timeline.all(:select => "timelines.text, timelines.created_at as date, users.*", :conditions => conditions, :joins => "INNER JOIN users using(twitter_id)", :order => "timelines.created_at desc", :limit => 30)      

    @ranking   = Timeline.all(:select => "twitter_id, screen_name, profile_image_url, count(*) as cnt", :conditions => "timelines.created_at between (now() - INTERVAL 1 WEEK) and now()", :joins => "INNER JOIN users using(twitter_id)", :group => "twitter_id", :order => "cnt desc", :limit => 10)      
end

end
