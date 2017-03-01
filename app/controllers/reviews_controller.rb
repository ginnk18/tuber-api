class ReviewsController < ApplicationController

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    tutor = Tutor.find(params["tutor_id"])
    @review = tutor.reviews.new(review_params)

    if @review.save
      response = {status: "Your review has been saved", reviews: tutor.reviews}, status: :created
    else
      response = {status: "Couldn't save that", reviews: tutor.reviews}, status: :bad_request
    end
    render json: response
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.fetch(:review, {})
    end
end
