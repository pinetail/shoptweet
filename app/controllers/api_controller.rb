# -*- coding: utf-8 -*- 
class ApiController < ApplicationController
  
  def users
    @users = User.all(:select => "profile_image_url, twitter_id, screen_name, lat, lng, description", :conditions => ['lat is not null'], :order => "created_at desc")
#    @users = User.find(:all)
    respond_to do |format|
      format.html
      format.xml { render :xml => @users }
      format.json { render :json => @users, :callback => params[:callback] }
    end
  end

  def timelines
    
    if params[:timestamp]
      conditions = ['timelines.created_at > from_unixtime(' + params[:timestamp] + ')']
    else 
      conditions = ['']
    end
    
    @timelines = Timeline.all(:select => "timelines.twitter_id, timelines.text, timelines.created_at, users.profile_image_url, users.screen_name", :conditions => conditions, :joins => "INNER JOIN users using(twitter_id)", :order => "timelines.created_at desc")
#    @users = User.find(:all)
    headers['Content-Type'] = "text/html;charset=utf-8"

    respond_to do |format|
      format.html
      format.xml { render :xml => @timelines }
      format.json { render :json => @timelines.to_json, :callback => params[:callback] }
    end
  end

end
