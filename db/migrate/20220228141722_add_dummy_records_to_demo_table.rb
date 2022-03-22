class AddDummyRecordsToDemoTable < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do 
        10.times do |i|
          puts "Creating demo #{i+1}"
          Demo.create(
            name: "demoname #{i+1}",
            description: "desc #{i+1}",
          )
        end
      end

      dir.down do
        10.times do |i|
          puts "Deleting demo #{i+1}"
          Demo.find_by(name: "demoname #{i+1}").destroy
        end
      end
    end
  end
end