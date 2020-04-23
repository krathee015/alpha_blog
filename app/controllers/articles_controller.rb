class ArticlesController<ApplicationController
    
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
        
    end

    def index
        @a_index = Article.all
    end
    
    def new
        @article = Article.new
    end 

    def edit
        
    end

    def create
        #render plain: params[:article]
        @article = Article.new(article_pramas)
        #render plain: @a_create.inspect
        if @article.save
        #redirect_to article_path(@a_create)
            flash[:notice] = "Article was created successfully"    
            redirect_to(@article) #shortcut 
        else 
            render 'new'
        end
    end

    def update
        
        if @article.update(article_pramas)
            flash[:notice]= "Article is updated successfully"
            redirect_to(@article)
            
        else
            render 'edit'
        end
    end

    def destroy
        #byebug
        @article.destroy
        redirect_to articles_path
    end

    private
    
    def set_article
        @article =Article.find(params[:id])
    end

    def article_pramas
        params.require(:article).permit(:title, :description)
    end 

end
