class GemsController < ApplicationController
  def show
    @gemID = params[:id]
  end
  def view
    if params[:date] == nil
      @date = Date.today()
    else
      @date = Date.parse params[:date]
    end
  end
  skip_before_action :verify_authenticity_token
  def create
    hash = params
    hash = JSON.parse(hash) if hash.is_a?(String)
    # Verify pass
    userPass = hash["pass"]
    if User.find_by(name:hash["username"]).pass == userPass
      s = Submission.create()
      s.time = s.created_at
      s.date = Date.today()
      s.user = User.find_by(name:hash["username"]).id
      s.title = hash["title"]
      s.url = hash["url"]
      s.description = hash["description"]
      s.karma = 0
      s.save
      render inline: "okay"
    else
      render inline: "fail"
    end
  end
  def upvote
    if session[:user_id] != nil
      gem = Submission.find(params[:id])
      # Verify user has not already upvoted this gem
      if gem.votes.include? session[:user_id].to_s+","
        redirect_to "/gems"
      else
        gem.karma += 1
        gem.votes += session[:user_id].to_s+","
        gem.save
        redirect_to "/gems/"
      end
    else
      @alert = "You must be logged in to upvote!"
      @date = Date.today()
      render :view
    end
  end
  def downvote
    gem = Submission.find(params[:id])
    gem.karma -= 1
    gem.save
    redirect_to "/gems/"
  end
end
