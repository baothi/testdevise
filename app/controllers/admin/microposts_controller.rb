class Admin::MicropostsController < ApplicationController
  before_action :set_admin_micropost, only: [:show, :edit, :update, :destroy]

  # GET /admin/microposts
  # GET /admin/microposts.json
  def index
    @admin_microposts = Admin::Micropost.all
  end

  # GET /admin/microposts/1
  # GET /admin/microposts/1.json
  def show
  end

  # GET /admin/microposts/new
  def new
    @admin_micropost = Admin::Micropost.new
  end

  # GET /admin/microposts/1/edit
  def edit
  end

  # POST /admin/microposts
  # POST /admin/microposts.json
  def create
    @admin_micropost = Admin::Micropost.new(admin_micropost_params)

    respond_to do |format|
      if @admin_micropost.save
        format.html { redirect_to @admin_micropost, notice: 'Micropost was successfully created.' }
        format.json { render :show, status: :created, location: @admin_micropost }
      else
        format.html { render :new }
        format.json { render json: @admin_micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/microposts/1
  # PATCH/PUT /admin/microposts/1.json
  def update
    respond_to do |format|
      if @admin_micropost.update(admin_micropost_params)
        format.html { redirect_to @admin_micropost, notice: 'Micropost was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_micropost }
      else
        format.html { render :edit }
        format.json { render json: @admin_micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/microposts/1
  # DELETE /admin/microposts/1.json
  def destroy
    @admin_micropost.destroy
    respond_to do |format|
      format.html { redirect_to admin_microposts_url, notice: 'Micropost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_micropost
      @admin_micropost = Admin::Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_micropost_params
      params.require(:admin_micropost).permit(:content, :user_id)
    end
end
