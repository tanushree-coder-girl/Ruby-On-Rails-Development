class Student < ApplicationRecord
   # kaminari gem for pagination 
   paginates_per 10

   # Active storage image uploading 
   has_one_attached :profile_image

   # has many association 
   has_many :blogs
   # has and belongs to many association
   has_and_belongs_to_many :courses
   # has_many through association 
   has_many :student_projects
   has_many :projects, through: :student_projects
   
   # validations
   validates :first_name, :last_name, :email, presence: true
   validates :email, uniqueness: true
   validates :first_name, :last_name, length: {minimum:3, maximum:50}
   validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/ , message: "Only lettter are allowed"}
   validates :permanent_contact_number, presence: true, numericality: true
   
   # Custom Validation 
   validate :validate_student_age

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

   def validate_student_age 
      if self.date_of_birth.present?
         age = Date.today.year - self.date_of_birth.year 
         if age < 15 
            errors.add(:age, ' Please Provide a Valid date of birth here. Age must be greater than 15 ')
         end
      end
   end 

   # Instance Methods
   def full_name
      "#{first_name} #{last_name}"
   end

   def age 
     return nil unless date_of_birth.present? 
     return Date.today.year - date_of_birth.year 
   end 

   def name_with_email 
      "#{full_name} / #{email}"
   end
end
