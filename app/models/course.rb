class Course < ApplicationRecord 
    # Active Supoort Concern
    include Validatable

    has_and_belongs_to_many :students
    # By Default rails understand lexical order of creating join table association but if we define name of join table like students_courses then we need to define join_table: 'table name' As Example: 👉   has_and_belongs_to_many :students, join_table: 'students_courses'
end

