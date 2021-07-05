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
      @feed = Feed.new
  end
  def confirm
    @feed = Feed.new(feed_params)
  end

  # POST /feeds or /feeds.json
  def create
    @feed = current_user.feeds.build(feed_params)
    @user = @feed.user.name
    if params[:back]
      render :new
    else
    if @feed.save
    redirect_to feeds_path, notice: "写真を投稿しました！"
    else
      render :new
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
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: "Feed was successfully destroyed." }
      format.json { head :no_content }
    end
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
