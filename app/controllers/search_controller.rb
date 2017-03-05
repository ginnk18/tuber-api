class SearchController < ApplicationController

  # GET /search
  def index

    # First filter by associated subject
    if params[:subject] == "*"
      tutors = Tutor.all
    else
      subject = Subject.find_by(name: params[:subject])
      tutors = subject.tutors
    end

    # Then filter by other attributes that aren't in activeRecord
    search_result = []
    tutors.each do |tutor|
      included = true

      if !(tutor.status_code.to_i == params[:status_code].to_i || params[:status_code] == "*")
        puts 'here1'
        included = false
        next
      end

      if !(JSON(tutor.current_location)["city"] == params[:city] || params[:city] == "*")
        puts 'here2'
        included = false
        next
      end

      if !((tutor.rate_cents/100 > params[:rate_range].to_i &&
            tutor.rate_cents/100 < params[:rate_range].to_i + 20) ||
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

    # Finally, sort if applicable
    case params[:sort]
    when "*"

      render json: search_result.take(25), status: 200

    when "rate-lowest-first"

      search_result = search_result.sort_by {|tutor| tutor["rate_cents"]}
      render json: search_result.take(25), status: 200

    when "rate-highest-first"

      search_result = search_result.sort_by {|tutor| tutor["rate_cents"]}
      render json: search_result.reverse.take(25), status: 200

    when "review"

      search_result = search_result.sort_by {|tutor| [tutor.reviews.average(:rating) ? 1 : 0, tutor.reviews.average(:rating)]}
      render json: search_result.reverse.take(25), status: 200
    end

  end


end