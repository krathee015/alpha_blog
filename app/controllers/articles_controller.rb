class ArticlesController<ApplicationController
    def show
        @article =Article.find(params[:id])
    end

    def index
        @a_index = Article.all
    end
    
    def new
        @a_create = Article.new
    end 

    def create
        #render plain: params[:article]
        @a_create = Article.new(params.require(:article).permit(:title))
        #render plain: @a_create.inspect
        if @a_create.save
        #redirect_to article_path(@a_create)
            redirect_to(@a_create) #shortcut 
        else 
            render 'new'
        end
    end



end
