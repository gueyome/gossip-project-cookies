class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:show, :new]

  def index
    @gossips = Gossip.all
  end

  def show
    a = params[:id]
    @gossip = Gossip.find(a)
  end

  def new
    @gossip = Gossip.new
  end

  def create
    puts params
    title_form = params["title"]
    content_form = params["content"]
    current_id = session[:user_id]
    @gossip = Gossip.new(title: title_form, content: content_form, user_id: current_id)
    
    if @gossip.save
      flash[:success] = "Le Gossip a bien été créé"
      redirect_to gossips_path
    else
      render "new"
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(content: params[:content], title: params[:title])
      flash[:success] = "Le Gossip a bien été modifié"
      redirect_to @gossip
    else
      render "edit"
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.destroy
      flash[:success] = "Le Gossip a bien été supprimé"
      redirect_to gossips_path
    else
      render "show"
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Il faut se connecter pour effectuer cette action"
      redirect_to new_session_path
    end
  end



end
