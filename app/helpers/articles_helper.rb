module ArticlesHelper

    def article_params
        params.require(:article).permit(:title, :description, :tag_list, :image)
      end
end
