  module Api
    module V1
      class ProfilesController < ApplicationController
        before_action :set_profile, only: [:show, :update, :destroy]
        
        # GET to /profiles 
        # GET to /profiles.json 
        def index
          @profiles = Profile.order('created_at DESC')
          render json: {status: 'SUCCESS', message: 'Loaded Witches & Wizards', data: @profiles}, status: :ok
        end  
        
        # GET to /profiles/1
        # GET to /profiles/1.json
        def show
          render json: {status: 'SUCCESS', message: 'Loaded Wizard', data: @profile}, status: :ok
        end
        
        # POST /profiles
        # POST /profiles.json
        def create
          @profile = Profile.new(profile_params)
          
          if @profile.save
            render json: {status: 'SUCCESS', message: 'Created Wizard', data: @profile}, status: :created
          else 
            render json: {status: 'ERROR', message: 'Wizard not created', data: @profile.errors}, status: :unprocessable_entity
          end
        end
        
        # PUT/PATCH /profiles/1
        # PUT/PATCH /profiles/1.json
        def update
          if @profile.update_attributes(profile_params)
            render json: {status: 'SUCCESS', message: 'Updated Wizard', data: @profile}, status: :ok
          else
            render json: {status: 'ERROR', message: 'Wizard not updated', data: @profile.errors}, status: :unprocessable_entity
          end
        end
        
        # DELETE /profiles/1
        # DELETE /profiles/1.json
        def destroy
          @profile.destroy
          render json: {status: 'SUCCESS', message: 'Deleted Wizard', data: @profile}, status: :ok
        end
        
        private
        # Use callbacks to share common setup between actions
        def set_profile
          @profile = Profile.find(params[:id])
        end
        
        # Never trust parameters from the internet, only allow through whitelisted
        def profile_params
          params.require(:profile).permit(:name, :location, :body)
        end
      end
    end  
  end