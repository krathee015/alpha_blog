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

    def edit
        @a_create = Article.find(params[:id])
    end

    def create
        #render plain: params[:article]
        @a_create = Article.new(params.require(:article).permit(:title))
        #render plain: @a_create.inspect
        if @a_create.save
        #redirect_to article_path(@a_create)
            flash[:notice] = "Article was created successfully"    
            redirect_to(@a_create) #shortcut 
        else 
            render 'new'
        end
    end

    def update
        @a_create = Article.find(params[:id])
        
        if @a_create.update(params.require(:article).permit(:title))
            flash[:notice]= "Article is updated successfully"
            redirect_to(@a_create)
            
        else
            render 'edit'
        end
    end



end
