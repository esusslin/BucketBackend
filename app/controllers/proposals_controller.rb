class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]
skip_before_action :verify_authenticity_token
  # GET /proposals
  # GET /proposals.json
  def index
    @proposals = Proposal.all
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

  # GET /proposals/1
  # GET /proposals/1.json
  def show
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(proposal_params)

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to @proposal, notice: 'Proposal was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal.destroy
    respond_to do |format|
      format.html { redirect_to proposals_url, notice: 'Proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(:item, :user_id)
    end
end
