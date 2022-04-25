class ApplicationController < ActionController::Base
    include Pagy::Backend

    # Action controller callbacks and filters 
    before_action :print_display_message 
    after_action :after_display_msg 

    def print_display_message
        puts '====================================================================I am so inherited before action filter============================================'
    end

    def after_display_msg
        puts '======================================================================================== I am After Action filter ===================================================='
    end  

    protected 
    def after_sign_in_path_for(resource)
        admin_dashboard_path
    end
end
