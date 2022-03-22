class Student < ApplicationRecord
   # has many association 
   has_many :blogs
   # has and belongs to many association
   has_and_belongs_to_many :courses
   # has_many through association 
   has_many :student_projects
   has_many :projects, through: :student_projects
   
   validates :first_name, :last_name, :email, presence: true

   before_create :succeess

   def succeess
      puts "This action perform before created record "
   end
end
