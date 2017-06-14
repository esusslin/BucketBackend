class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def url

    p params

    key = 'SEM3770FE56767FEDC920DD0DE5EA0480975'
    secret = 'Y2VkNzlkODQwYTI5NjAxMjAxOTEwYTdhMmQwN2I5ODQ'

    sem3 = Semantics3::Products.new(key,secret)

    sem3.products_field("url", params[:url])
    productsHash = sem3.get_products()
    bigJson = productsHash.to_json
    p "-------------------------------------"
    theprice = productsHash["results"][0]["price"]

    name = productsHash["results"][0]["name"]
    bucketprice = theprice.to_i / 8

    priceString = theprice.to_s
    bucketPriceString = bucketprice.to_s
    p name



    p "-------------------------------------"


    account_sid = "AC73e582be2582353535dc5a45da68b72d"

    auth_token = "553c4cd8a6a61ab103419abd1cd25ebd"
    client = Twilio::REST::Client.new(account_sid, auth_token)

     client.messages.create(
      to: "8023094153",
      from: "5189074976",
      body: "Emmet: Looks like you're intereseted in buying a #{name}. The best current market price for this item is $ " + priceString + ".00 via Amazon.  You can finance this purchase today with a bucket for " +  bucketPriceString + ".00 / month.  Item is delivered in 2 business days" 
      )


  end
  # GET /users/1
  # GET /users/1.json


  def show
    @user = User.find(params[:id])

    render json: @user
  end

  # GET /users/new
  def new

    p params
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    p params
    @user = User.new(first_name: params[:first_name])

    # respond_to do |format|
      if @user.save

        p "new user!"
        
        render json: {id: @user.id}
    #     # format.html { redirect_to @user, notice: 'User was successfully created.' }
         # render json: {message: "User created successfully"}
      else
        p "nope!"
    #     # format.html { render :new }
    #    # render.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name)
    end
end
