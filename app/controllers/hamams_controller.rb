class HamamsController < ApplicationController
  before_action :set_hamam, only: [:show, :edit, :update, :destroy]
  after_action :authorize_hamam, only: [ :show, :new, :create, :edit, :update ]

  # GET /hamams
  def index
    @hamams = policy_scope(Hamam)
  end

  # GET /hamams/1
  def show; end

  # GET /hamams/new
  def new
    @hamam = Hamam.new
  end

  # GET /hamams/1/edit
  def edit
  end

  # POST /hamams
  def create
    @hamam = Hamam.new(hamam_params)
    @hamam.user = current_user
    if @hamam.save
      redirect_to @hamam, notice: 'Hamam was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hamams/1
  def update
    if @hamam.update(hamam_params)
      redirect_to @hamam, notice: 'Hamam was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hamams/1
  def destroy
    authorize_hamam
    @hamam.destroy
    redirect_to hamams_url, notice: 'Hamam was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hamam
      @hamam = Hamam.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hamam_params
      params.require(:hamam).permit(:name, :user_id)
    end

    def authorize_hamam
      authorize @hamam
    end
end
