class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  # GET /parts
  # GET /parts.json
  def index
    @parts = Part.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parts }
    end
  end

  # GET /parts/1
  # GET /parts/1.json
  def show
  end

  # GET /parts/new
  def new
    @part = current_user.parts.new
  end

  # GET /parts/1/edit
  def edit
    @part = current_user.parts.find(params[:id])
  end

  # POST /parts
  # POST /parts.json
  def create
    @part = current_user.parts.new(params[:parts])

    respond_to do |format|
      if @part.save
        format.html { redirect_to @part, notice: 'Part was successfully created.' }
        format.json { render action: 'show', status: :created, location: @part }
      else
        format.html { render action: 'new' }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parts/1
  # PATCH/PUT /parts/1.json
  def update
    @part = current_user.parts.find(params[:id])

    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to @part, notice: 'Part was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1
  # DELETE /parts/1.json
  def destroy
    @part = current_user.parts.find(params[:id])
    @part.destroy
    respond_to do |format|
      format.html { redirect_to parts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_params
      params.require(:part).permit(:description)
    end
end
