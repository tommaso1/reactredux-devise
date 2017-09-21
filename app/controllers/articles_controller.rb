class ArticlesController < ApplicationController
  load_and_authorize_resource



  before_action :authenticate_user!, except: [ :index ]
  def index
    @articles = Article.all()

    render json: @articles
  end
  def create
    article = Article.create(
        title: article_params[:title],
        body: article_params[:body],
        user_id: current_user.id,
    )
    AdminMailer.article_submit_email(article).deliver_now
    render json: { article: article }
  end

  def destroy
    #@article = Article.find(params[:id])
    #authorize! :destroy, :article
    @article.destroy
    render json: {'ok':'ok'}
  end

  private
    def article_params
      params.permit( :title, :body)
    end

end
