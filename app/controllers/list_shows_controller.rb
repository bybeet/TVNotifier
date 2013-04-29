class ListShowsController < ApplicationController
  # GET /list_shows
  # GET /list_shows.json
  def index
    @list_shows = ListShow.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @list_shows }
    end
  end

  # GET /list_shows/1
  # GET /list_shows/1.json
  def show
    @list_show = ListShow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list_show }
    end
  end

  # GET /list_shows/new
  # GET /list_shows/new.json
  def new
    @list_show = ListShow.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list_show }
    end
  end

  # GET /list_shows/1/edit
  def edit
    @list_show = ListShow.find(params[:id])
  end

  # POST /list_shows
  # POST /list_shows.json
  def create
    @user = User.find_by_id(session[:user_id])
    show = Show.find(params[:show_id])
    @list_show = @user.list_shows.build
    @list_show.show = show
    #@list_show = ListShow.new(params[:list_show])

    respond_to do |format|
      if @list_show.save
        format.html { redirect_to @list_show, notice: 'Show was added to list.' }
        format.json { render json: @list_show, status: :created, location: @list_show }
      else
        format.html { render action: "new" }
        format.json { render json: @list_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /list_shows/1
  # PUT /list_shows/1.json
  def update
    @list_show = ListShow.find(params[:id])

    respond_to do |format|
      if @list_show.update_attributes(params[:list_show])
        format.html { redirect_to @list_show, notice: 'List was updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @list_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_shows/1
  # DELETE /list_shows/1.json
  def destroy
    @list_show = ListShow.find(params[:id])
    @list_show.destroy

    respond_to do |format|
      format.html { redirect_to list_shows_url }
      format.json { head :no_content }
    end
  end
end
