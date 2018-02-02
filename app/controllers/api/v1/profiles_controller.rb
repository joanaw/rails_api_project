  module Api
    module V1
      class ProfilesController < ApplicationController
        
        # GET to /profiles 
        # GET to /profiles.json 
        def index
          @profiles = Profile.order('created_at DESC')
          render json: {status: 'SUCCESS', message: 'Loaded Witches & Wizards', data:@profiles}, status: :ok
        end  
      end
    end  
  end