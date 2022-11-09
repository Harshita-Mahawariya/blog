class ArticlesController < ApplicationController
  

http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  #we will pass the para in address bar that
  # that will come in the parameter place
   def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to @article
    else
      flash[:danger] = 'Something went wrong.'
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
