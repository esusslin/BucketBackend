class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]
skip_before_action :verify_authenticity_token
  # GET /proposals
  # GET /proposals.json
  def index
    @proposals = Proposal.all

    render json: @proposals
  end


def url
         p params

    key = 'SEM3770FE56767FEDC920DD0DE5EA0480975'
    secret = 'Y2VkNzlkODQwYTI5NjAxMjAxOTEwYTdhMmQwN2I5ODQ'

    sem3 = Semantics3::Products.new(key,secret)

    sem3.products_field("url", params[:url])
    productsHash = sem3.get_products()
    bigJson = productsHash.to_json

    p bigJson
 p "-------------------------------------"
 bigJson = productsHash.to_json

     priceString = productsHash["results"][0]["price"]
     imageString = productsHash["results"][0]["images"][0]
     nameString = productsHash["results"][0]["name"]

     prop = Proposal.new
     prop.item = nameString
     prop.imageString = imageString
     prop.price = priceString.to_f
     prop.monthly = prop.price / 8
     prop.monthly = 8
     prop.user_id = 1


prop.save

p prop

render json: prop
end
end


  

#  