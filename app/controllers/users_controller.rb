class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:create, :new]
  before_filter :admin, only: [:index, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if @user.id != session[:user_id]
      redirect_to shows_path
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render:back json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if @user.id != session[:user_id]
      redirect_to shows_path
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User #{@user.username} was successfully created." }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    #Not the best way to do this...prevents an admin from updating someones info
    # => Adding in an "or is_admin" would solve this.
    # => I wonder if there is a way to do a before_filter involving the current user id and the desired id
    # =>    to ensure they match.
    if @user.id != session[:user_id]
      redirect_to shows_path
    else
      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to @user, notice: "User #{@user.username} was successfully updated." }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.id != session[:user_id]
      redirect_to shows_path
    else
      @user.destroy

      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
   end
 end
end
