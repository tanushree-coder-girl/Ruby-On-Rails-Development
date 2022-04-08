##================== RUBY ON RAILS ====================##

1. Introduction 
    a) Ruby on Rails is an open-source framework for database-backed web development in Ruby, an object-oriented programming language similar to Perl and Python.
    b) Rails is a web development framework which uses ruby as its core language. 
    c) Rails is an extremely productive framework for building database-backend web apps. 
    d) Is is a full stack development framework which includes everything needed to create a database-driven web application, using the Model-View-Controller Pattern. 
    e) Rails allows you to write less code while accomplishing more than many other languages and frameworks. 

    The Rails Philosophy: 
        1. Don't Repeat Yourself (DRY)
        2. Convention over configuration 
    
2. Setup And Installation 
    Official Ruby on Rails Website 
        https://rubyonrails.org/
    
    Learning Guide For Ruby On Rails 
        https://guides.rubyonrails.org/
    
    Learning Reference Link 
        https://www.tutorialspoint.com/ruby-on-rails/index.htm
    
    Download And Setup 
        You must have ruby installed for installing ruby on rails 
        Here is a article which can be helpful in installing ruby on rails..
            https://medium.com/@rgdev/how-to-install-ruby-rails-on-ubuntu-16-04-from-scratch-quickly-4da73c67daa3

3. Creating A rails project and running project
    You can create a rails project by using this command in terminal.
        rails new your-project-name-here

    Running rails application 
        navigate into your project-folder like 
            cd project-name
        
        running server using this command 
        rails server 
            or 
        rails s 

        Now open your browser your server is running on 
        http://localhost:3000 or http://127.0.0.1:3000

4. Rails MVC Architecture 
    MVC => It denotes As Model-View-Controller
        MVC is a pattern for the architecture of a software application. It separates an application into the following components. 

        Model 
            Models is for handling data and business logic. 
        
        Controllers 
            Controllers makes the model data available to the view, so it can display that data to the user, and saves or updates user data to the model.

        Views
            For Handling graphical user interface objects and presentation. 

                        MVC WEB Architecture - How Its Works (Flow) 
                        =========================================

        Browser(Domain) ===▶️ Rails Router =====▶️ Controller 
                                            =======| ||
                                            |      | ||
                                            |      | |=▶️ Model ====▶️ Database
                                          View     |       | ⬆️          ||
                                                   |       | |◀️========== 
                                                   ========|         
        Explain=> 
            In the Above diagram fistly address will be entered in Browser THen THe following Route will be checked in rails applicateion routes according to this then the request send to the controller then controller send its to the model if any database related works required . Then Model go into the database get the data and come back to the model then model send its in controller then controller go to the view page . Then finally View Renderer. And we will see the output the screen...

5. Controller
    What is controller 
        Controller consists of actions and callbacks which handles the request coming from the rails router. 

    Creating Controllers
        1) Create Controller manually and then you have to do everything manually like creating views, setting up routes etc. 
        2) Generate A new controller using rails generator command :
            rails generate controller your_controller_name methods
                or 
            rails g controller your_controller_name methods
            example 
                rails g controller main_page index

    Naming Convention for controller 
        (controllername)_controller.rb
        example  
            welcome_controller.rb

    lets create manually inside folder:
    app/controllers/welcome_controller.rb 
    and add some methods like 

        class WelcomeController < ApplicationController
            def index 
            end
        end

6. Set up your own root page  
    config/routes.rb
        For setting root route add like this
        root 'controller#method'

            root 'welcome#index'

        For setting get route like this
            get '/path', to: 'controller#method'
                or 
            get '/controller/method'

7. View page 
    view page must be written as controller name like if we have welcome_controller.rb then we have to create a folder in views name as welcome 

        app/views/welcome
    
    THen in welcome folder create your files like we have index method in controller so we have to create a file inside welcome name as index.html.erb . Erb is a extension which allows us to write ruby with html.

        app/views/welcome/index.html.erb 

8. Models 
    Models represents the M in the MVC architecture. 
    Model is the layer of the system responsible for representing business data and logic. 

    MVC WEb Architecture 
        Requests first come to the controller, controller finds an appropriate view and interacts with model which in turn interacts with database and send response to controller... 
            Guides: 
        https://guides.rubyonrails.org/active_record_basics.html

    Create Rails Model 
        rails g model model_name
        example
            rails g model student
        or also generate with database columns name using command like 
            rails g model student first_name:string last_name:string 
            
        So this generate model commands generate a model file and a migration file migration file inside db/migrate folder 
        Name as 
            20220221131624_create_students.rb
        This migration file is used to migrate our database table 

    To Run The Migration 
        rails db:migrate 
    
    All database table can be seen in schema.rb file 

9. Rails Migration Basics 
    Migrations are a feature of Active Record that allows you to evolve your database schema over time. 
    Rather than write schema modifications in pure SQL, migrations allow you to use a Ruby DSL to describe changes to your table. 

    Running a migration 
        rails db:migrate 
    Rollback a migration 
        rails db:rollback 

    What We Gonna Cover?
        1. Add attributes to a table using migrations.
            rails g migration add_columns_to_tablename column:type
            example
                rails g migration add_columns_to_students dob:datetime address:string age:integer
            check this for example => db/migrate/20220228141150_add_columns_to_students.rb
        2. Remove attribute from existing table 
            rails g migration remove_column_from_tablename column:type
            example
                rails g migration remove_age_from_students age:integer
                check this for example => db/migrate/20220228141318_remove_age_from_students.rb
        3. Rename existing columns  
            rails g migration rename_column_in_tablename
            example 
                rails g migration rename_dob_in_students
                check this for example => db/migrate/20220228141505_rename_dob_in_students.rb
                Add like this in file
                    rename_column :table_name, :old_column_name, :new_column_name
                as
                    rename_column :students, :dob, :date_of_dirth
                Then run rails db:migrate

            For destroying migration use
            rails d migration migration_name
            like:
                rails d migration create_users

        Note => Necessary to run rails db:migrate after creating any migration file to see the changes in records..

10. Resource 
    A resource is generally a database table which is represented by a model, and acted on through a controller. 

    Resource Routing => 
        Defining your controller as resource in routes, allow you to quickly declare all of the common routes for a given resourceful controller. 
            example 
                resources: students 
        Things To remember:
            Name your resource controller as plural, just like it's table for model. 
        Create your resource controller 
            create a file into app/controllers and name it as students_controller.rb 
            Define your resource into config/routes.rb
        For check all routes run in terminal 
            rails routes 
        and For check particular resource routes 
            rails routes | grep students 

11. Seed File in Rails 
    Rails seed files are a useful way of populating a database with the initial data needed for a Rails project. THe rails db/seeds.rb file contains plain Ruby code and can be run with the rails-default rails db:seed task.

    For practical example check 
        db/seeds.rb
    After writing dummy data THen Run 
        rails db:seed                                                               

12. RubyGems
    Gems in Rails are libraries that allow any Ruby on Rails developer to add functionalities without writing code. You can also call Ruby on Rails gems as plugins for adding features. A Ruby gem enables adding features without creating the code again and again.

    Here you can find gems 
    https://rubygems.org/

    firstly add gem in Gemfile then run bundle install 
    example: 
        gem 'faker', '~> 2.19'
        bundle install

13. Rails Console 
    Rails console is a command line program for interacting with the Rails applications. It has the full power of the Ruby language and Rails environment.

    TYpe in Terminal => rails c or rails console

    then check your databases, table, data, query etc.. 
    MyTableName                     #for check table type table name
    MyTableName.count               #for check total num of records in table
    MyTableName.first               #for find first record in table
    MyTableName.last                #for find last record in table
    MyTableName.all               #for find All records in table
    
    For reload rails console type 
    reload! 
    for exit console type 
    exit 

14. Listing All Records From Database 
    @records = TableName.all 

    example 
        def index 
            @students = Student.all
        end
    
    Now you can use this instance variable in view in index.html.erb
    Practical Example view => app/views/students/index.html.erb
    Practical Example controller => app/controllers/students_controller.rb

    Inside Erb file you can use ruby like 
        <%  @students.each do |student| %>
            <td> <%= student.first_name %> </td>
        <% end %>

        <% %> let's you evaluate the rails code in your view
        <%= %> let's you evaluate the rails code in your view AND prints out a result on the page

15. Creating Form New action 
    Rails provide form helper for creating form 
    https://guides.rubyonrails.org/form_helpers.html

    create new action and add 
    def new
        @student = Student.new
    end   

    THen create a template for new as new.html.erb 
    Then create your form using form helper 
    practical example 
    app/views/students/new.html.erb 

16. Submit a Form => Create Action  

        def create 
            @student = Student.new(students_params)
            if @student.save 
                redirect_to students_path
            else 
                render :new
            end
        end

        private 
        def student_params
            params.require(:student).permit(:first_name, :last_name, :email, :address)
        end

    For practical example => app/controllers/students_controller.rb

17. Show Action 
    Show action is used to display particular record

        def show
            @student = Student.find(params[:id])
        end 

    For practical example => app/controllers/students_controller.rb

18. Edit Action 

        def edit 
            @student = Student.find(params[:id])
        end

    And Create A tempate for edit.html.erb 
    and your form here 
    now you need update action for update data 
    For practical example => app/controllers/students_controller.rb

19. Update Action 

        def update
            @student = Student.find(params[:id])
            if @student.update(student_params) 
                redirect_to student_path(@student)
            else
                render :edit
            end
        end

    For practical example => app/controllers/students_controller.rb

20. Destroy Action 
    For destroy action you need link with method: :delete like 
    <%= link_to 'Delete', student, method: :delete, data: {confirm: "Are You sure"} %> 

        def destroy 
            @student = Student.find(params[:id])
            @student.destroy 
            redirect_to students_path
        end

    For practical example => app/controllers/students_controller.rb and app/views/students/index.html.erb

21. Refactoring THe controller code 
     @student = Student.find(params[:id])

     this line is repeat in show , edit , update, destroy 
     so we will create a private method and use before action to refactor our code like 

    create a private method 

        def set_student
            @student = Student.find(params[:id])
        end

    And Add a before action in which method you need this code 

        before_action :set_student, only: %i[show edit update destroy] 

     For practical example => app/controllers/students_controller.rb

22. Partials 
    1) Partials are a way of breaking the rendering process into more manageable chunks. With a partial , you can move the code for rendering a particular piece of a response to its own file. 
    2) To Render a partial as part of a view , you need to use the render method within the view. 
    example 
        <%= render 'form' %> 
    3) Partials always start with the underscore character. And this makes partials template different from regular view templates. 
    4) Partials are mainly used to refactor the regular the regular view templates and keep them very light weight. 
    5) You can also pass local variables to the partial template. 
    Example 
        <%= render 'form', student: @student %>

    For practical example => app/views/students/_form.html.erb
    app/views/students/new.html.erb 
    app/views/students/edit.html.erb    
 
23. Notice/ Flash messages 
    A flash message is a way to communicate information with the users of your Rails application so they can know what happens as a result of their actions.

    https://www.rubyguides.com/2019/11/rails-flash-messages/

    example
    redirect_to students_path, notice: "Student Added Succeessfully"
    <p><%= notice %></p>

    Here We Create our first student crud app- 😍
    Lets Summarise What We do in out Resource Controller 
    1) Generating a student model 
    2) Run migration 
    3) Then We added Some Dumy Data using Seed file - rails db:seed
    4) Adding Resource route     - resources :students 
    5) Creating Resouce Controller - students_controller.rb
    6) Add folder in views     - students 
    7) Then We create 7 Actions in Controller for perfuming Crud 
        Action 
            index            => GET           => listing all data
            show             => GET           => Show particular data
            new              => GET           => Creating student Form 
            create           => POST          => for add student data in database
            edit             => GET           => edit record form
            update           => PUT           => update record 
            destory          => DELETE        => destorying user 

    Note => index , show, new, edit this are collection methods 
    and create, update, destroy They are member methods 

    we have to create separate templates for get requests so we create inside students folder as 
    index.html.erb                          => for displaying all data
    show.html.erb                           => for display one particular record
    new.html.erb                            => for adding record from view form
    edit.html.erb                           => for edit an existing record

24. Rails Scaffold
    Rails scaffolding is a quick way to generate some of the major pieces of an application. If you want to create the models, views, and controllers for a new resource in a single operation, scaffolding is the tool for the job.

    create resource using Scaffolding
        rails generate scaffold resource_name attr_name:datatype 
            or
        rails g scaffold resource_name attr_name:datatype 

    example 
        rails g scaffold course name:string description:text

    Note => rails g scaffold commands generated all views , modal , migrations and controller. 
    So scaffold create a CRUD For us... 
    After running scaffold run rails db:migrate 

    Scaffold also create by default stylesheets => app/assets/stylesheets/scaffolds.scss
    if we don't need stylesheets then we can delete this 

25. Scaffold vs resources 
    What to Choose Between Scaffolding and resources from scratch ?
        If you use a scaffold you will instantly have to go through the code and remove a large percentage of the code along with around 50% of the files themselves. Whereas if you run the resource generator, it simply creates the: migrations, model, routes, controller, and asset pipeline files. 

    In my opinion For professional work resources from scratch is much better & recommended
    And for testing and learning purpose scaffold is ok..

26. Active Record Model in Details 
    ➡️ Active Record represent the Model in MVC architecture. 
    ➡️ It is Responsible for representing business data and logic. 
    ➡️ It allows you to create and use the business objects whose data requires persistent storage to a database. 
    ➡️ The active Record model use the ORM framework to store objects into database. 

    SQL VS ORM Query 
        SQL => select * from students; 
        ORM => Student.all 

    Some Basics ORM Query
        1). For finding Records in Database  
            Tablename.first                             # to get first record 
            Tablename.last                              # to get last record 
            Tablename.all                               # to get all records
            Tablename.find(1)                           # for find record with id 1
            Tablename.where("id = ?", 10)               # for find record where id 10
        2). For Add Data in Database  
            First Way-
                addRecord = Tablename.new                   
                addRecord.name = "xyz"
                addRecord.save  
            Second Way-
                addRecord = Tablename.new(name:"xyz")     
                addRecord.save                 
            Third Way
                Tablename.create(name:"xyz") 
        3). For Update Existing Record In Database 
            a = Tablename.find(1)                  # find record which we want to update
            a.update(name:"jonny")
        4). For Delete record 
            record = TableName.find(25)
            record.delete 
                or
            record.destroy 
            Tablename.destroy_all                  # for destroy all records
        5). For check validations and errors messages 
            record = record.new(name: "xyz")
            record.valid? 
            record.errors.any? 
            record.errors.count 
            record.errors.full_messages 
            record.errors.messages 
        6). Check All Table available in our application
            ActiveRecord::Base.connection.tables

27. Active Record Migrations 
    Migrations are a feature of Active Record that allows you to evolve your database schema over time. Rather than write schema modifications in pure SQL, migrations allow you to use a Ruby DSL to describe changes to your tables.
    You cannot create migrations manually you must be generate migrations using rails generators command..
    Rails adds a table to your schema named schema_migrations which stores the timestamp of each migration in a single column. It doesn't show up in the schema. rb , but Rails will compare the timestamps in db/migrate and the timestamp of schema.

28. Schema Versioning in Rails 
    Schema versioning depends on which migration you run at last..
        ActiveRecord::Schema.define(version: 2022_02_23_074559) do
    so this version depends on the last running migration timestamp 
    In our case we run this migration last time.. 
        db/migrate/20220223074559_create_courses.rb 
    so the schema verion is 
        (version: 2022_02_23_074559)
    
29. Rails Migration for Create Table 
    rails g migration create_table_name column:datatype

30. Rails Migration for Add / Remove/ Rename exisiting columns. 
    Add Columns-    
        rails g migration add_attributes_to_table column:datatype 
    
    Remove Columns-
        rails g migration remove_attribute_from_table column:datatpye 
    
    Rename Columns-
        rails g migration rename_attribute_in_table 
        rename_column :table_name, :old_column_name, :new_column_name

31. Migration For Changing Types of existing columns 
    rails g migration change_type_of_attr_in_table
    change_column :table, :column, :newDatatypeHere

    Note => We should not use Change method to change type of exisiting columns bcoz when we rollback or reverse our migration file then it will create issues and problems 

    So When we need to use change type of existing columnns then instead of change method we must have to use up and down method or reversible block inside change method in code ... 

    For Example 
    First Way to do: 

        def change 
            reversible do |dir|
                dir.up do 
                    change_column :table, :column, :newDatatypeHere
                end
                dir.down do 
                    change_column :table, :column, :oldDataTypeHere
                end
            end
        end
    Practical => db/migrate/20220228140945_change_type_permanent_address_in_students.rb

    Second Way to do 

        def up
            change_column :table, :column, :newDatatypeHere
        end

        def down 
            change_column :table, :column, :oldDataTypeHere
        end

    Practical => db/migrate/20220228140823_change_type_local_address_in_students.rb

32. Reversible Migration In Rails
    Introduced in Rails 4.0, reversible makes it possible to tell a migration using change (instead of up and down ) how to reverse migrations that Active Record doesn't know how to reverse by default, so that you can specify code to be executed whether migrating forward or rolling back, even inside a migration implemented .

    def change 
        reversible do |dir| 
            dir.up do 
                .....
            end
            dir.down do 
                ....
            end
        end
    end

    For example => if you add dummy data using migration inside change method then it will always add records in db... when we rub rollback then it will also add record for this reason we need reversible block of code 
    practical Example => 
        rails g migration add_dummy_records_demo_table
    ➡️   check this file => db/migrate/20220228141722_add_dummy_records_to_demo_table.rb

33. Run A Specific Migration 
    rails db:migrate:up VERSION=Timestamp_of_your_migration 
    rails db:migrate:down VERSION=Timestamp_of_your_migration 

    Example 
        rails db:migrate:up VERSION=20220222065111
        rails db:migrate:down VERSION=20220222070007

    Rollback last n migrations 
        rails db:rollback STEP=N 
            example => rails db:rollback STEP=5
        rails db:migrate:redo STEP=N 
            example => rails db:migrate:redo STEP=5

34. Old Version Rails Migration 
    Old Version Migrations uses up and down method instead of change method. Change Methods is introduced in Rails 3.1 verion. Before this we use up and down method 
    The up and down methods are a more granular way of defining the change method in a Rails migration. The up method is a set of instructions of what to do when you migrate, and the down method is a set of directions of what to do when you rollback.

    Example :
        def up 
            add_column :demos, :testing, :string
        end
        def down 
            remove_column :demos, :testing
        end

    For practical example => db/migrate/20220228134526_add_attr_to_demos.rb

35. Associations 
    An Association is a connection between two Active Record Models. 

    Why Association-:
        1. To Implement relationship between two real world entities.
        2. Association Makes common operations simpler in rails.

    Types Of Associations
        1. has_many 
        2. belongs_to 
        3. has_one
        4. has_and_belongs_to_many 
        5. has_many:through 
        6. has_one:through

    💠 has_many Association 
        1. Indicates a one-to-many connection with another model. 
        2. Each instance of the model has zero or more instances of another model. 

            example
                class Post < ApplicationRecord 
                    has_many :comments 
                end

    💠 belongs_to Association 
        A belongs_to association sets up a connection with another model, such that each instances of the declaring model "belongs_to" one instance of the other model. 

            example 
                class Comment < ApplicationRecord 
                    belongs_to :post 
                end

        One To Many Relationship 
            has_many + belongs_to = one to many 

    Keys 
        1. Primary key 
            By default, Active Record will use an integer column named id as the table's primary key. 
            A primary key is used to ensure data in the specific column is unique.
        2. Foreign Key 
            A foreign key is a column or group of columns in a relational database table that provides a link between data in two tables. 2. It uniquely identifies a record in the relational database table.

    Practical Example on File => app/models/blog.rb 
                                 app/models/student.rb
            In this example we can see that => 
                student has many blogs and blog belongs to a student
    Add Foreign key like student_id example in file 
                    db/migrate/20220303063920_create_blogs.rb

        WE can access blog of a students like 
            Student.first.blogs 
        or we can access student by blog like 
            Blog.first.student
    
    💠 has_one Association 
        Specifies one-to-one association with another class.
        Same as has_many association, but only indicates that the other model can belongs to only one instance to the model defining has_one association. 
        Model Name are always in singluar form. 

        example 
            class Employee < ApplicationRecord 
                has_one :account 
            end

            class Account < ApplicationRecord 
                belongs_to :emplyee 
            end

        One To one Relationship 
            has_one + belongs_to = one to many 

    References => The references add a foreign key of another model as  
    Example => rails g model sub_demo title:string demo:references
        so this will add a forign key in table like 
            t.integer "demo_id", null: false
    
    Practical Example on file :
        app/models/demo.rb
        app/models/sub_demo.rb

    💠 has_and_belongs_to_many 
        👉 has_and_belongs_to_many association is used to implement a many to many relationship between two real world entities. 
        👉 has_and_belongs_to_many association creates a direct many to many connection with another model , with no intervening model. but requires a join table to support the association. 
        👉 This association indicates that each instance of the declaring model refers to zero or more instances of another model. 

        example :

            class Course < ApplicationRecord
                has_and_belongs_to_many :students
            end

            class Student < ApplicationRecord
                has_and_belongs_to_many :courses
            end
        
    Note 
    # By Default rails understand lexical order of creating join table association but if we define name of join table like students_courses then we need to define join_table: 'table name' As Example: 👉   has_and_belongs_to_many :students, join_table: 'students_courses'
        
    join_table
        1. Unless the join table is explicitly specified as an option, it is guessed using the lexical order of the class names.
        2. The Join Table should not have a primary key or a model assoiciated with it. You must manually generate the join table with a migration.
        3. has_and_belongs_to_many relationship has no JOIN model, just a database table.

    Let's generate migration for join 2 tables 
        rails g migration create_tables1_tables2_join_table 
        example
            rails g migration create_courses_students_join_table

        Join Table Migration:

            class CreateCoursesStudentsJoinTable < ActiveRecord::Migration[6.1]
                def change
                    create_join_table :courses, :students
                end
            end 

    Practical Example on file
        db/migrate/20220303091055_create_courses_students_join_table.rb
        app/models/course.rb
        app/models/student.rb

        WE can access students of first course like 
            Course.first.students 
        or we can access course by first student like 
            Student.first.courses
        We can access join table in rails console like 
            Course.connection.execute "select * from courses_students"
        We can add data like 
            Course.last.students << Student.last

    💠 has_many:through 
        Also used for joining tables but has_many through is better choice when we need a separate model for join table.
        Aside from the actual code you write, the main difference between the two approaches is that in a has_many :through relationship, the JOIN table has its own model, while a has_and_belongs_to_many relationship has no JOIN model, just a database table.

        example:
            class Project < ApplicationRecord
                has_many :student_projects
                has_many :students, through: :student_projects  
            end

             class Student < ApplicationRecord
                has_many :student_projects
                has_many :projects, through: :student_projects  
            end
    Create Scaffold for project 
        rails g scaffold project name:string description:text 
    Let's generate model for join tables 
        rails g model student_project student:references  project:references 
    
            class StudentProject < ApplicationRecord
                belongs_to :student
                belongs_to :project
            end

    Add a column in StudentProject
        rails g migration add_submission_date_to_student_projects submission_date:date
    Lets migrate db
        rails db:migrate

    lets check in rails console by adding data in StudentProject and access 
        StudentProject.create(student_id:1, project_id:1, submission_date:Date.today + 30.days)
    Access like 
        Student.first.projects
        Project.first.students

    Practical example on file 
        app/models/student_project.rb
        app/models/project.rb
        app/models/student.rb 

    💠 has_one:through 
        Rails has a has_one :through association that helps set up a one-to-one association with a third model by going through a second model. 

        example:
            class Department < ApplicationRecord
                has_one :manager
                has_one :manager_history, through: :manager
            end

            class Manager < ApplicationRecord
                belongs_to :department
                has_one :manager_history
            end

            class ManagerHistory < ApplicationRecord
                belongs_to :manager
            end

    Generate Model file for Each Table like:
        rails g model department name:string 
        rails g model manager name:string email:string contact:string department:references 
        rails g model manager_history joining_date:date total_experience:string manager:references

    Practical Example: 
        app/models/department.rb
        app/models/manager.rb
        app/models/manager_history.rb

    Lets check in rails console by adding dumy data 
        Department.create(name:"account")
        Department.create(name:"finance")
        Manager.create(name:"RK sharma", email:"rk@gmail.com", contact:"123-123-123-2", department_id:Department.find(2).id)
        Manager.create(name:"Chirag Mehta", email:"mehta@gmail.com", contact:"9879879980", department_id:Department.find(1).id)
        ManagerHistory.create(joining_date:Date.today - 100.days, total_experience:"10 years", manager_id: Manager.first.id)

    Access department and manager history of first manager Like
        Manager.first.department
        Manager.first.manager_history
    Access manager of first department like 
        Department.first.manager 
        Department.first.manager_history 
    Access manager and department of manager history 
        ManagerHistory.first.manager
        ManagerHistory.first.manager.department

36. Polymorphic Associations 
    By implementing a polymorphic associations, a model can belong to more than one other model, on single associations. 

        example
            class Event < ApplicationRecord
                has_many :comments, as: :commentable
            end

            class Article < ApplicationRecord
                has_many :comments, as: :commentable
            end

            class News < ApplicationRecord
                has_many :comments, as: :commentable
            end

            class Comment < ApplicationRecord
                belongs_to :commentable, polymorphic: true
            end

    Commands for creating Model:
        rails g model news title:string is_live:boolean
        rails g  model event title:string venue:string address:string scheduled_at:date
        rails g model article title:string description:text 
        rails g model comment title:string

    rails g migration add_polymorphic_attr_to_comments

        class AddPolymorphicAttrToComments < ActiveRecord::Migration[6.1]
            def change
                add_column :comments, :commentable_type, :string
                add_column :comments, :commentable_id, :integer
            end
        end

    rails db:migrate 

    Practical Example on file: 
        app/models/event.rb
        app/models/article.rb
        app/models/news.rb
        app/models/comment.rb
    db/migrate/20220305081516_add_polymorphic_attr_to_comments.rb

    Now You can Check in rails c
    Add Dumy Data:
        Event.create(title:"carrier counselling", venue:"plaxa palace", address:"Bangalore", scheduled_at:Date.today + 10.days)
        News.create(title:"road accident in lucknow", is_live:true)
        Article.create(title:"Critism", description:"problem n solutions")

    Add Data in comments 
        Event.first.comments.create(title:"great event")
        News.first.comments.create(title:"Sad News")
        Article.first.comments.create(title:"Nice Article")

    Access Like 
        Event.first.comments
        News.first.comments
        Article.first.comments
    
    Access parent model using Comment table Like 
        Comment.find(1).commentable 
        Comment.find(2).commentable 
        Comment.find(3).commentable 

37. Active Records Callbacks  
    Callbacks are methods that get called at certain moments of an object's life cycle.
    example:

        class Student < ApplicationRecord
            before_create :greeting_msg

            def greeting_msg
                puts "Before Create Action performs before creating an object "
            end

            <!-- One more way to write callbacks like-->
            before_create do 
                puts "I will run before create an object"
            end
        end

    CallBacks Executed on Creating an object 
        before_validation 
        after_validation 
        before_save 
        around_save 
        before_create 
        around_create 
        after_create 
        after_save 
        after_commit
        after_rollback
    
    Callbacks Executed on Updating an object 
        before_validation 
        after_validation 
        before_save 
        around_save 
        before_update 
        around_update 
        after_update 
        after_save 
        after_commit 
        after_rollback
    
    Callbacks Executed On deleting an object 
        before_destroy 
        around_destroy 
        after_destroy 
        after_commit 
        after_rollback 

    Common Callbacks 
        For Create / Update and delete 
            after_commit 
            after_rollback 
        For Create And Update 
            before_validation 
            after_validation 
            before_save 
            around_save 
            after_save 
            
    Practical Example on => app/models/demo.rb  
    For live use practical example => app/models/student.rb

38. Validations 
    Validations are the way using which we can ensure that only valid data is saved into the database. 
    We will focus on Model Level validations only . 

    Other WAys to validate Data before save 
        1. Database Constraints
        2. Client Side validations 
        3. Controller level validations 

    When Validation performed? 
        1. Create 
        2. Update 
        3. Save 
    
    Rails Console 
        check data is valid or not 
            varaible.valid? 
        check data is invalid or not 
            varaible.invalid? 
        For check errros 
            variable.errors 
        For check error message 
            varaible.errors.messages 
            varaible.errors.full_messages  
        Example 
            presence 
            uniqueness 
            numerically 
            format 
    Syntax 
        validates :attribute, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}, format: { with: ConstantData::VALID_EMAIL_REGEX }, if: :method_name?
   
   Practical Example 
        Check validation in => app/models/student.rb 

39. Instance Methods for active record objects 
    Instance method are methods which require an object of its class to be created before it can be called. To invoke a instance method, we have to create an Object of the class in which the method is defined.

    Instance Method 
        def full_name
            "#{first_name} #{last_name}"
        end

    Use of instance method in view like 
        <%= @instance_variable.full_name%> 

    Practical Example on file : app/models/student.rb
                                app/views/students/show.html.erb

40. Active Record Queries 
    Active REcord Queries are the best way to perform database operations in Rails rather than writing raw SqL queries.

        example:1 
            Fetch All Studetn From Database 
            Active Record Queries like
                Student.all 
            Raw SQL queries like 
                select * from students; 

        example:2
            Fetch a single Student from Database with id provided 
            Active Record Queries like
                Student.find(id) 
            Raw SQL queries like 
                select * from students where students.id = id; 

    Some Active REcord Query Methods: 
        1. find 
        2. find_by 
        3. first/last 
        4. where 
        5. order 
        6. select 
        7. limit 
    
    1. Find 
        The find Method requires an arguement and that is the primary key of that model instance. 
            Student.find(1)
            Student.find(1,2,3,4)

    2. find_by 
        Finds the first record matching the specified conditions.
            Student.find_by(id: "5")
            Student.find_by(first_name: "abc")
            Student.find_by(date_of_birth: Date.today - 20.years)
            Student.find_by(email: 'abc@gmail.com')
    
    3. Pluck 
        for find a separate column of all records 
            Student.pluck(:email)

    4. First and last 
        Student.first
        Student.last
        Student.first(5)

    5. where 
        It returns a new relation, which is the result of filtering the current relation according to the conditions in the arguments. 
        The where method allows you to specify conditions to limit the records returned, representing the WHERE part of the SQL statement. Conditions can either be specified as a string, array or hash. 
        Student.where(first_name: "xyz")
        Student.where('first_name = ?', 'xyz')
        Student.where(id: 1..20)
        Student.where(id: [1,2,3,4,5])
        Student.where('id IN (?)', 1..20)
        Student.where('id IN (?)', [1,2,3,4,5])
        Student.where('id IN (?)', 1..5).find(2)
        Student.where('id IN (?)', 1..5).class 
    
    6. order 
        Retrives the record from the database in an specific order 
        Default order is ascending 
        Student.order(:first_name)
        Student.order('first_name')
        Student.order(first_name: :desc)
        Student.order('first_name DESC')
        Student.order(first_name: :asc, email: :desc)
        Student.order(:first_name, email: :desc).first
        Student.order(:first_name, email: :desc).find(10)
        Student.order(:first_name, email: :desc).find_by(email: 'ashy@gmail.com')
    
    7. select query 
        Find only specific columns 
        Student.select(:id, :first_name, :last_name)
        Student.where('id IN (?)', 1..5).select(:email, :id)

    8. Limit Method 
        Student.limit(5)
        Student.order(:first_name).limit(2)
        Student.limit(5).offset(10)             returns 5 records starting from 10th 

    9. Array Methods Vs Query Methods
        Difference between array and Query method is that we cannnot chaining others methods on array method. 

        example 
            Student.first(5).order(:first_name)    //Cannot use like this bcoz first is array method 
            Student.limit(5).order(:first_name)    //CAn use like this bcoz limit is query method 

        Example 
        Array Method 
            Student.first(5)
            Student.last(5)
        Query Method 
            Student.limit(5)
            etc...

        How can we check is array method or query method? 
        So we can check like this 
            Student.first(5)).class 
            Student.limit(5).class

        So by using .class we can check whether it is array method or query method 

41. N+1 Query Problem and its solution 
    What is N+1 Query Problem? 
        It happens when a query is executed on each results of the previous query. 
        It is fine if the application is very small and has very few resources. 
        for example:
            blogs = Blog.all
            blogs.each { |blog| puts blog.student.email }
            So the query runs every time for each student 
        Solution for N+1 queries 
            Eager Loading 
            for example 
                blogs = Blog.includes(:student)
                blogs.each { |blog| puts blog.student.email}
                So you can find that this time query run only once 

42. Eager loading in rails
    Eager Loading is the process whereby a query loads a resource as soon as the code is ececuted. It also leads the related entities (association) as part of the query. 
        Eager Loading Methods 
            1. includes 
                @blogs = Blog.includes(:student)
            2. preload 
                @blogs = Blog.preload(:student)
            3. eager_load
                @blogs = Blog.eager_load(:student)

    Recommended method is includes
    Practical on : app/controllers/blogs_controller.rb

43. ActionController in details 
    Action controller is the C in the MVC 
        After the router has determined which controller to use for a request, the controller is responsible for making sense of the request and producing the appropriate output. 

44. Action controller Callbacks in Controller 
    Rails provides before and after actions in controllers as an easy way to call methods before or after executing controller actions as response to route requests. Action Callbacks can be particularly helpful when implementing authentication/authorization for example, and are heavily used by gems such as Devise.

        before_action :greeting_msg 
        after_action :goodbye_msg 

        def greeting_msg 
            puts "welcome"
        end

        def goodbye_msg 
            puts "Take Care"
        end
    
    Practical check : app/controllers/application_controller.rb

45. Action View in Rails 
    Action View is the V in MVC 
    In Rails, web requests are handled by Action Controller and Action View. Typically, Action Controller is concerned with communicating with the database and performing CRUD actions where necessary. Action View is then responsible for compiling the response.

46. Rails Routing in Details: 
    Root Route 
        root 'controllername#methodname'
    Get route 
        get 'controller/method'
        get '/url' , to:'controller#method'
        get '/url' => 'controller#method'
        get "/url" => "controller#method", :as => :student
    Get route with params
        get '/url/:id', to: 'controller#method'
    post route 
        post '/students', to 'students#create'
    put route
        post 'students/:id', to 'students#update'
    Delete route 
        delete '/students/:id' => 'students#destroy'
    Resource route 
        resources :resource_name
        resources :one_resource, :two_resource, :three_resource

    CRUD Routing Is like : 
        get '/users/new' => 'users#new'
        post '/users' => 'users#create'
        get '/users/:id' => 'users#show'
        get '/users/:id/edit' => 'users#edit'
        patch '/users/:id' => 'users#update'
        delete '/users/:id' => 'users#destroy'

    This is the file where you can handled all the routes of your app => config/routes.rb

47. Members And collection routing 
    Member route is a route which requires the id of the resource to perform an action. 
    Collection method does not require any id.

    example:1

        resource :students do 
            member do 
                get 'your_route'
            end

            collection do 
                get 'collection_route_here'
            end
        end

    Note: If you only need to add one member or collection route then you can also write like 
        
        resource :student do
            get :member_route_herre, on: :member,
            get :collection_route_here, on: :collection,
        end

    If You don't write member block or collection block then by default it will considered as member route as: 

        resource :student do 
            get :your_route
        end

    You can CHeck your routes by type
    rails routes 

48. Namespace and scoped routing 
    This is the simple option. When you use namespace , it will prefix the URL path for the specified resources, and try to locate the controller under a module named in the same manner as the namespace

    if you want to add controller inside a separate folder like 
    app/controllers/admin/students_controller.rb  
    Then you can create folder inside controller and add your controller file and define namespace route like 
        namespace :admin do 
            resources :students
        end

    check routes => rails routes |grep admin
         admin_students GET    /admin/students(.:format)   
        
    If you want to remove admin prefix in url then you can use scope module like 
        scope module: :admin do 
            resources :students
        end

    check routes => rails routes |grep admin
        admin/students#index  GET    /students(.:format) 

    If you want add only prefix with any resource route then use scope routing 
    scope routing check controller inside controller folder but add prefix in url like 
        scope :admin do 
            resources :students
        end

    check routes => rails routes |grep admin
        students#index  GET    /admin/students(.:format) 

49. Using Active Support Concern in Rails 
    A rails concern is any module that extends ActiveSupport::Concern module.
    A concern modelue looks like this:

        module ConcernModule 
            extend ActiveSupport::Concern
            
            included do
                # do something here
            end

            def some_method 
                # do something here
            end
        end

    Then include concern in models like 
        include ConcernModule
    
    Active Support Concern must be created in app/models/concerns folder 
    Practical on : app/models/concerns/validatable.rb 
                    app/models/course.rb    

50. Scope in Active Record 
    Scopes are custom queries that you define inside your Rails models with the scope method. Every scope takes two arguments:
    A name, which you use to call this scope in your code.
    A lambda, which implements the query.
    like: 
        scope :name, -> { where(:attibute => value)}
    With Argument:
        scope :name, ->(argument){ where(attribute: argument) }
    using Lamba
        scope :name, lambda { where(:attibute => value)}

    Ex:- scope :active, -> {where(:active => true)}
        Then you can use this scope like: Modalname.active

    Practical on : app/models/concerns/validatable.rb 

51. Action Helpers in Rails 
    Helpers are used to extract complex logic out of the view so that you can organize your code better.
    example 
        module ApplicationHelper 
            def my_helper_method(varalbe)
                # your code
            end
        end 
        
    Use this inside view like this 
        my_helper_method(varaible)
    
    Write action helpers inside helper folder 
    app/helpers 

    Practical example on: app/helpers/application_helper.rb 
    Use of this helper in : app/views/students/show.html.erb

52. Action Helpers method in controller 

    <!-- We have to include application helper for use helpers in controllers  -->
    include ApplicationHelper 

    <!-- Helper method use -->
    def print
        formatted_date(date) 
    end 

    <!-- Helper method -->
    def formatted_date(date)
        date.strftime('%A, %b %d, %Y') if date.present?
    end

    Check : app/controllers/students_controller.rb 

53. Introduction to webpacker 
    Webpacker is a rails wrapper around the webpack. 
    Webpack 
        Allow you to write your front end code in a way that is convenient for developers and then package that code in a way that is convenient for browsers. 
    Sprockets vs webpacker
        Webpackers => It is better to use over Sprockets if you want to work with modern javascript and rails. 
        Sprockets => It is better choice than webpacker if you are working with legacy web application , because migration can be costly there. 
    Webpacker code is write inside: ⬇️
        app/javascript/packs/application.js

54. Using Twitter Bootstrap with webpacker 
    1. Install using npm or yarn
        yarn add bootstrap@4.3.1 jquery popper.js
    2. Add this in  config/webpack/environment.js
        const webpack = require("webpack")
        environment.plugins.append("Provide", new webpack.ProvidePlugin({
            $: 'jquery',
            jQuery: 'jquery',
            Popper: ['popper.js', 'default']
        }))
    3. Then create css a folder inside app/javascript 
        app/javascript/css 
        inside css folder create application.scss file 
        app/javascript/css/application.scss
        Then add this in application.scss 
        @import "~bootstrap/scss/bootstrap.scss";
    4) Go to app/views/layouts/application.html.erb
        Change link tag to pack tag 
        This 
    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
        To this 
    <%= stylesheet_pack_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    5) THen Go to app/javascript/packs/application.js 
        add this
            import "css/application";
            import $ from 'jquery';
            global.$ = jQuery; 
            import "bootstrap"; 

55. Working With bootstrap 
    Now you can add bootstrap components and grid system in your app as you like your design to be created. 
    for example: 
        we add a container in application.html.erb so you can add all other styling in all files as you like:
         <div class="container">
            <div class="row">
                <%= yield %>
            </div>
        </div> 
    
56. Adding Header Footer partials 
    Create folder inside view for partials 
    app/views/shared 
    in this add your partials file 
        app/views/shared/_footer.html.erb
        app/views/shared/_header.html.erb
    And Render it in your application.html.erb like 
        <%= render "shared/header" %>
        <%= render "shared/footer" %>

57. Bootstrap Admin Theme Integration in Rails 
    sb-admin2 => https://startbootstrap.com/theme/sb-admin-2
