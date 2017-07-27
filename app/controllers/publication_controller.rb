class PublicationController < ApplicationController

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)

    if @publication.save
 		   redirect_to @publication
 		else
 			render :new
 		end

  end

  def show
    @publication = Publication.find(params[:id])
  end

  def index

    @aviso = "Proximamente lista de las fotos"

  end

  private

  def publication_params
    params.require(:publication).permit(:name,:description,:place,:permission_pub)
  end

end
