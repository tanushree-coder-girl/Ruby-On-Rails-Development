class Student < ApplicationRecord
   # has many association 
   has_many :blogs
   # has and belongs to many association
   has_and_belongs_to_many :courses
   # has_many through association 
   has_many :student_projects
   has_many :projects, through: :student_projects
   
   # validations
   validates :first_name, :last_name, :email, presence: true

   # Active record callbacks 
   before_create :display_student_age
   after_update :display_student_age
   after_commit :display_student_age
   after_destroy :display_student_age

   def display_student_age
      if self.date_of_birth.present?
         age = Date.today.year - self.date_of_birth.year 
         puts "======================== Age of #{self.first_name} is #{age} ========================================="
      else
         puts "=============Age cannot br calculated without date of birth============"
      end
   end
end
