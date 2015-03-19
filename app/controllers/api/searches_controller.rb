module Api
  class SearchesController < ApplicationController

      def show
            @name = (params[:name])
            @location = (params[:location])

            @images = GetGeolocatedImages.call(@name, @location)
            
            render json: @images
      end

      def yelp

         @name = (params[:name])
         @location = (params[:location])
         
         @results = Yelp.client.search( @location, { term: @name, limit: 3 })
         # get the latitude and longitude coordinates and pass them into Instagram location search
         render json: @results.businesses
    
      end

      def review

            @name = (params[:name])
            @location = (params[:location])

            @document_results = GetReviews.call(@name, @location)

            render json: @document_results

      end

  end

end