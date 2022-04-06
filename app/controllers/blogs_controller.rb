class BlogsController < ApplicationController
    before_action :set_blog, only: %i[ show edit update destroy ]
  
    def index
        #@blogs = Blog.all
        #@blogs = Blog.preload(:student)
        #@blogs = Blog.eager_load(:student)
        @blogs = Blog.includes(:student)
        #@blogs = Blog.includes(:student).references(:student).where('students.first_name = ?', 'Ashu')
        #@blogs = Blog.eager_load(:student).references(:student).where('students.first_name = ?', 'Ashu')
    end
  
    def show
    end
  
    def new
      @blog = Blog.new
    end
  
    def edit
    end
  
    def create
      @student_id = Student.first.id
      @blog = Blog.new(blog_params)
      if @blog.save 
        redirect_to blogs_path, notice: :"Blog Has Been Created Successfully"
      else
        render :new 
      end
    end
  
    def update
        if @blog.update(blog_params) 
            redirect_to blog_path(@blog), notice: 'Blog has been Updated Successfully'
        else
            render :edit
        end
    end
  
    def destroy
        @blog.destroy 
        redirect_to blogs_path, notice: 'Blog has been deleted Successfully'
    end
  
    private
      def set_blog
        @blog = Blog.find(params[:id])
      end
  
      def blog_params
        params.require(:blog).permit(:title, :content, :student_id)
      end
  end
  