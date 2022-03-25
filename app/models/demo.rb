class Demo < ApplicationRecord
    has_one :sub_demo

    validates :name, presence: true, length: {minimum: 10, maximum: 50}
    
    # Active records calllbacks
    before_create :greeting_message 
    around_create :around 
    after_create :create_k_bad

    before_update :update_hone_s_phle 
    around_update :update_around_k_wkt 
    after_update :update_hone_k_bad

    before_destroy :destroy_hone_s_phle 
    around_destroy :destroy_around_k_wkt 
    after_destroy :destroy_hone_k_bad

    before_save :save_se_phle
    around_save :save_k_around
    after_save :save_k_bad 

    after_rollback :rollback_k_baad
    after_commit :commit_s_baad

    before_validation :validation_s_phle
    after_validation :validation_k_bad

     # 1st way to write active records callbacks 
    before_create do
        puts "I am run before create an object another way of writing"
    end

    # 2nd way and preferred way to write actvie records callbacks
    def greeting_message
        puts "Hello, I am before create active record callback and It will run before you create an object"
    end

    def around
        puts "I am run Around Create An object"
    end

    def create_k_bad
        puts "I am run after create an object"
    end 

    def update_hone_s_phle
        puts "I am run before_update an object"
    end  

    def update_around_k_wkt
        puts "I am run around_update an object"
    end 

    def update_hone_k_bad
        puts "I am run after_update an object"
    end 

    def save_se_phle
        puts "I am run before_save an object"
    end 

    def save_k_around
        puts "I am run around_save an object"
    end 

    def save_k_bad
        puts "I am run after_save an object"
    end 

    def destroy_hone_s_phle
        puts "I am run before_destroy an object"
    end  

    def destroy_around_k_wkt
        puts "I am run around_destroy an object"
    end 

    def destroy_hone_k_bad
        puts "I am run after_destroy an object"
    end 

    def rollback_k_baad
        puts "I am run after_rollback an object"
    end 

    def commit_s_baad
        puts "I am run after_commit an object"
    end 

    def validation_s_phle
        puts "I am run before_validation an object"
    end 

    def validation_k_bad
        puts "I am run after_validation an object"
    end 

end
