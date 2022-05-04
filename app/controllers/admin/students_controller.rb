class Admin::StudentsController < AdminController 
    #layout 'admin'
    include ApplicationHelper 

    before_action :set_student, only: %i[show edit update destroy] 

    helper_method :formatted_date

    # for displaying all records 
    def index
        # @students = Student.all.page(params[:page])
        @q = Student.ransack(params[:q])
        @students = @q.result(distinct: true).page(params[:page])
    end
    
    # for creating form instance 
    def new
        @student = Student.new
    end

    # we need create action for submitting a form 
    def create
        # First Way: this way will works but this is not recommended way..
        # @student = Student.new(
        #     first_name: params[:student][:first_name],
        #     last_name: params[:student][:last_name],
        #     email: params[:student][:email],
        #     address: params[:student][:address],
        # )

        # Second WAy : this is right way to do 
        @student = Student.new(student_params)

        if @student.save 
            # mailer 
            CrudNotificationsMailer.create_notifications(@student).deliver_now 

            redirect_to admin_students_path , notice: "Student Added Succeessfully"
        else
            render :new
        end
    end 

    def show
        #@student = Student.find(params[:id])

        puts formatted_date(@student.date_of_birth) 
    end 

    def edit 
        #@student = Student.find(params[:id])
    end

    def update
        #@student = Student.find(params[:id])
        if @student.update(student_params) 
             # mailer 
             CrudNotificationsMailer.update_notifications(@student).deliver_now 

            redirect_to admin_student_path(@student), notice: 'Student has been Updated Successfully'
        else
            render :edit
        end
    end
    
    def destroy
        #@student = Student.find(params[:id])
        @student.destroy 

        # mailer 
        CrudNotificationsMailer.delete_notifications(@student).deliver_now 


        redirect_to admin_students_path, notice: 'Student has been deleted Successfully'
    end

    private
    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:first_name, :last_name, :email, :local_address, :permanent_address, :permanent_contact_number, :alternate_contact_number, :date_of_birth, :profile_image)
    end 

    def formatted_date(date)
        date.strftime('%A, %b %d, %Y') if date.present?
    end
end