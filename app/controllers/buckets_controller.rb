class BucketsController < ApplicationController
  before_action :set_bucket, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /buckets
  # GET /buckets.json
  def index
    @buckets = Bucket.all

    render json: @buckets
  end


  # GET /buckets/1
  # GET /buckets/1.json
  def show
  end

  # GET /buckets/new
  def new
    @bucket = Bucket.new
  end

  # GET /buckets/1/edit
  def edit
  end

  # POST /buckets
  # POST /buckets.json
  def create

    p params
    @bucket = Bucket.new(bucket_params)

    @bucket.save

    render json: @bucket
    # respond_to do |format|
    #   if @bucket.save
    #     format.html { redirect_to @bucket, notice: 'Bucket was successfully created.' }
    #     format.json { render :show, status: :created, location: @bucket }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @bucket.errors, status: :unprocessable_entity }
    #   end
    
  end

  # PATCH/PUT /buckets/1
  # PATCH/PUT /buckets/1.json
  def update
    respond_to do |format|
      if @bucket.update(bucket_params)
        format.html { redirect_to @bucket, notice: 'Bucket was successfully updated.' }
        format.json { render :show, status: :ok, location: @bucket }
      else
        format.html { render :edit }
        format.json { render json: @bucket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckets/1
  # DELETE /buckets/1.json
  def destroy
    @bucket.destroy
    respond_to do |format|
      format.html { redirect_to buckets_url, notice: 'Bucket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bucket
      @bucket = Bucket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bucket_params
      params.require(:bucket).permit(:item, :user_id, :item, :monthly, :months)
    end
end
