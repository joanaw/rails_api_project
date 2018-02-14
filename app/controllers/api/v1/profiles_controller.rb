  module Api
    module V1
      class ProfilesController < ApplicationController
        
        # GET to /profiles 
        # GET to /profiles.json 
        def index
          @profiles = Profile.order('created_at DESC')
          render json: {status: 'SUCCESS', message: 'Loaded Witches & Wizards', data:@profiles}, status: :ok
        end  
        
        # GET to /profiles/1
        # GET to /profiles/1.json
        def show
          @profile = Profile.find(params[:id])
          render json: {status: 'SUCCESS', message: 'Loaded Witch or Wizard', data:@profile}, status: :ok
        end
        
        # POST to /profiles
        # POST to /profiles.json
        def create
          @profile = Profile.new(profile_params)
          
          if @profile.save
            render json: {status: 'SUCCESS', message: 'Created Witch/Wizard', data:@profile}, status: :created
          else 
            render json: {status: 'ERROR', message: 'Witch/Wizard not created', data:@profile.errors}, status: :unprocessable_entity
          end
        end
        
        
        private
        # Never trust parameters from the "scary" internet, only allow the white list through
        def profile_params
          params.permit(:name, :location, :body)
        end
      end
    end  
  end