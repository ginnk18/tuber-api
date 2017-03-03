class SearchController < ApplicationController

  # GET /search
  def index
    #TO DO: Apply all filters to tutors list
    puts 'in search endpoint. params:'
    puts params.inspect
    if params[:subject] == "*"
      tutors = Tutor.all
    else
      subject = Subject.find_by(name: params[:subject])
      tutors = subject.tutors
    end

    search_result = []
    tutors.each do |tutor|
      included = true

      # Check availability
      if !(tutor.status_code == params[:status_code] || params[:status_code] == "*")
        puts 'here1'
        included = false
        next
      end

      # Check city
      if !(JSON(tutor.current_location)["city"] == params[:city] || params[:city] == "*")
        puts 'here2'
        included = false
        next
      end

      # Check if rate is in range
      if !((tutor.rate_cents/100 > params[:rate_range].to_i &&
            tutor.rate_cents/100 > params[:rate_range].to_i) ||
            params[:rate_range] == "*")
        puts 'here3'
        included = false
        next
      end

      if included
        puts "here4"
        search_result.push(tutor)
      end
    end
    puts search_result.length
    render json: search_result, status: 200
  end


end