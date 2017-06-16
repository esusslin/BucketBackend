class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /users
  # GET /users.json

  def lol
      p params["bucket"]

      thebuck = params["bucket"]

      bucket = Bucket.new(item: thebuck["item"], price: Float(thebuck["price"]), monthly: Float(thebuck["monthly"]), months: Float(thebuck["months"]), user_id: "1", imageString: thebuck["imageString"])
      bucket.save

      render json: bucket
  end

  def newBucket

  end


  def index
    @users = User.all
  end

  
  # GET /users/1
  # GET /users/1.json


  # def show
  #   @user = User.find(params[:id])

  #   render json: @user
  # end

  # # GET /users/new
  # def new

  #   p params
  #   # @user = User.new
  # end

  # # GET /users/1/edit
  # def edit
  # end

  # # POST /users
  # # POST /users.json
  # def create

  #   p params
  #   @user = User.new(first_name: params[:first_name])

  #   # respond_to do |format|
  #     if @user.save

  #       p "new user!"
        
  #       render json: {id: @user.id}
  #   #     # format.html { redirect_to @user, notice: 'User was successfully created.' }
  #        # render json: {message: "User created successfully"}
  #     else
  #       p "nope!"
  #   #     # format.html { render :new }
  #   #    # render.json { render json: @user.errors, status: :unprocessable_entity }
  #   #   end
  #   end
  # end

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /users/1
  # # DELETE /users/1.json
  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_user
  #     @user = User.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def user_params
  #     params.require(:user).permit(:first_name)
  #   end
end
