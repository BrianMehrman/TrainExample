class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  # GET /trains
  # GET /trains.json
  def index
    @trains = Train.all.order(:run_number)
  end

  # GET /trains/1
  # GET /trains/1.json
  def show
  end

  # GET /trains/new
  def new
    @train = Train.new
  end

  # GET /trains/1/edit
  def edit
  end

  # POST /trains
  # POST /trains.json
  def create
    @train = Train.new(train_params)

    respond_to do |format|
      if @train.save
        format.html { redirect_to @train, notice: 'Train was successfully created.' }
        format.json { render action: 'show', status: :created, location: @train }
      else
        format.html { render action: 'new' }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trains/1
  # PATCH/PUT /trains/1.json
  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to @train, notice: 'Train was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trains/1
  # DELETE /trains/1.json
  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to trains_url }
      format.json { head :no_content }
    end
  end

  def import
    require 'csv'
    file = params[:train][:upload_file].read
    csv = CSV.parse(file, :headers => true)
    # binding.pry
    headers = csv.headers.map{|h| h.downcase.to_sym}
    flash[:error] = []
    csv.each do |row|
      out_hash = headers.inject({}){|hash,elm| hash[elm] = row.fields[headers.index(elm)]; hash}
      train = Train.new(out_hash)
      unless train.save

        flash[:error] << "#{train.train_line} - #{train.route_name} with operator #{train.operator_id}: #{train.errors.full_messages.join(", ")}"
      end
    end
    redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train
      @train = Train.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def train_params
      params.require(:train).permit(:train_line, :route_name, :run_number, :operator_id)
    end
end
