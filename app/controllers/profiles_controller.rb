class ProfilesController < ApplicationController
    def new
        # Form show up on the page that allows the user to fill out info for their profile.
        @user = User.find( params[:user_id] )
        @profile = Profile.new
    end
    
    def create
        @user = User.find( params[:user_id] )
        @profile = @user.build_profile(profile_params)
        
        if @profile.save
            flash[:success] = "Profile updated!"
           redirect_to user_path( params[:user_id] ) 
        else
            flash[:danger] = "Error saving profile."
            render action: :new
        end
    end
    
    def edit
        
    end
    
    def show
        
    end
    
    private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
        end
end