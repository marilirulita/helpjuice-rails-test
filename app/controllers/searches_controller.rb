class SearchesController < ApplicationController
  before_action :set_search, only: %i[ show edit update destroy ]

  # GET /searches or /searches.json
  def index
    @user = User.find(params[:user_id])
    @search = @user.searches.new
    
    if params[:title].present?
      @articles = Article.where("title ILIKE ?","%#{params[:title]}%")
      else
        @articles = Article.all
      end

      if turbo_frame_request?
        render partial: "articles", locals: { articles: @articles }
      else
        render :index
      end
  end

  # GET /searches/1 or /searches/1.json
  def show
    @user = User.find(params[:user_id])
    @search = @user.searches.find(params[:id])
  end

  # GET /searches/new
  def new
    @search = Search.new
    @user = User.find(params[:user_id])
  end

  # POST /searches or /searches.json
  def create
    @user = User.find(params[:user_id])
    @search = @user.searches.new(search_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to user_searches_url, notice: "Search was successfully created." }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1 or /searches/1.json
  def destroy
    @search.destroy

    respond_to do |format|
      format.html { redirect_to user_searches_url, notice: "Search was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_params
      params.require(:search).permit(:title, :user_id)
    end
end
