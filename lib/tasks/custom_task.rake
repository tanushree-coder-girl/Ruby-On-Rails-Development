namespace :custom_task do
    desc 'Say Hello to user'
    task say_hello: :environment do 
        puts "===================== Helloooooooooooo Everyoneeee ================"
    end
end