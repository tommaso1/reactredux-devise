class ArticlesController < ApplicationController
  load_and_authorize_resource



  before_action :authenticate_user!, except: [ :index ]
  def index
    @articles = Article.all()

    render json: @articles
  end
  def create
    article = Article.create(
        title: params[:article][:title],
        body: params[:article][:body]
    )
    render json: { article: article }
  end

  def destroy
    #@article = Article.find(params[:id])
    #authorize! :destroy, :article
    @article.destroy
    render json: {'ok':'ok'}
  end



end
