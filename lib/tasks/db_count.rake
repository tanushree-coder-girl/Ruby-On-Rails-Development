namespace :db_count do
  desc "Student counting task"
  task student_count: :environment do
    puts "Total Number of students is #{Student.count} "
  end

  task blog_count: :environment do
    puts "Total Number of Blogs is #{Blog.count} "
  end

end
