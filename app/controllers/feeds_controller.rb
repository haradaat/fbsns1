class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?

  # GET /feeds or /feeds.json
  def index
    @feeds = Feed.all
  end

  # GET /feeds/1 or /feeds/1.json
  def show
  end

  # GET /feeds/new
  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end
  def confirm
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    render :new if @feed.invalid?
  end

  # POST /feeds or /feeds.json
  def create
    @feed = Feed.new(feed_params)
    
    if params[:back]
      render :new
    else
    if @feed.save
    redirect_to feeds_path, notice: "写真を投稿しました！"
    end
  end
end
  # PATCH/PUT /feeds/1 or /feeds/1.json
  def update
    if @feed.update(feed_params)
      redirect_to feeds_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  # DELETE /feeds/1 or /feeds/1.json
  def destroy
    @feed.destroy
    redirect_to feeds_path, notice:"ブログを削除しました！"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feed_params
      params.require(:feed).permit(:image, :image_cache, :user_id)
    end
end
