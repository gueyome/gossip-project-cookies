class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def index
    @comments = Comment.all
  end
  
  def show
    a = params[:id]
    @comment = Comment.find(a)
  end

  def new
    @comment = Comment.new
  end


  def create
    puts content_form = params["comment"]["content_form"]
    puts gossip_id = params["gossip_id"]
    current_id = session[:user_id]
    @comment = Comment.new(content: content_form, user_id: current_id, gossip_id: gossip_id)
    
    if @comment.save
      flash[:success] = "Le Commentaire a bien été créé"
      redirect_to gossip_path(gossip_id)
    else
      render "new"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def update
    @comment = Comment.find(params[:id])
    gossip_id = params["gossip_id"]
    if @comment.update(content: params[:content])
      flash[:success] = "Le Commentaire a bien été modifié"
      redirect_to gossip_path(gossip_id)
    else
      render "edit"
    end
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "Le Commentaire a bien été supprimé"
      redirect_to gossip_path(params[:gossip_id])
    else
      render "edit"
    end
  end


end
