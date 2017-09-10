class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  #create y new no van aca por favor quitarlo despues de los test
  before_action :authenticate_user!, except: [:show, :index, :create, :new, :find_by_name]
  #  quitar esto luego de las pruebas
  # skip_before_action :verify_authenticity_token, only: [:create,:new]
  protect_from_forgery with: :null_session

  # GET /publications
  # GET /publications.json
  def index
    if user_signed_in? then
      @publications = Publication.recientes.compartidos
    else
      @publications = Publication.recientes.publicos
    end
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create
    if user_signed_in?
      @publication = current_user.publications.new(publication_params)
    else
      @user = User.new
      @publication = @user.publications.new(publication_params)
    end
    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def misfotos
    @publications = current_user.publications.recientes
  end

  def find_by_name
    @publication = Publication.find_by(name: set_publication_name)
    if @publication
      redirect_to @publication
    else
      redirect_to publications_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    def set_publication_name
      params[:name]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:name, :description, :place, :permission_pub, :photo)
    end
end
