class ProfilesController < ApplicationController
    def new
        # Form show up on the page that allows the user to fill out info for their profile.
        @user = User.find( params[:user_id] )
        @profile = @user.build_profile
    end
    
    def create
    
    end
    
    def edit
        
    end
    
    def show
        
    end
end