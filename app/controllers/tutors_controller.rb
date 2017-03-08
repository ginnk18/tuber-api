class TutorsController < ApplicationController


   # GET /tutors
  def index
    @tutors = Tutor.all
    puts "tutor count: ", Tutor.count
    render json: @tutors
  end

  # GET /tutors/1
  def show
    tutor = Tutor.find(params["id"])
    if tutor
      tutor.email = tutor.user.email
      render json: tutor,
             include: [
                        {:reviews => {:include => :student}},
                        :subjects,
                        {:user => {only: :description}}
                      ],
             status: :created
    else
      render status: :bad_request
    end
  end

  # GET /tutors/new
  def new
    @tutor = Tutor.new
  end

  # GET /tutors/1/edit
  def edit
  end

  # POST /tutors
  def create
    console.log('Im in creat tutor')
    @tutor = Tutor.new(tutor_params)

    if @tutor.save
      redirect_to @tutor, notice: 'Tutor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tutors/1
  def update

    @tutor = set_tutor
    params[:tutor].each do |key, val|
      if (key == "subjects")
        @tutor.subjects.destroy_all
        val.each { |subject| @tutor.subjects.new(name: subject)}
      end

      if (key == "current_location")
        curr_location = JSON.parse(@tutor.current_location)
        curr_location[:other] = val[:other] || curr_location[:other]
        @tutor.current_location = curr_location.to_json
      end

      @tutor.phone = val if key == "phone" && !val.empty?
      @tutor.education = val if key == "education" && !val.empty?
      @tutor.experience = val if key == "experience" && !val.empty?
      @tutor.rate_cents = val.to_i if key == "rate_cents" && val.to_i > 0
    end
    if @tutor.save
      render json: @tutor,
              include: [
                {:reviews => {:include => :student}},
                :subjects,
                {:user => {only: :description}}
              ],
             status: :created
    else
      render status: :bad_request
    end
  end

  # DELETE /tutors/1
  def destroy
    @tutor.destroy
    redirect_to tutors_url, notice: 'Tutor was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor
      @tutor = Tutor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tutor_params
        byebug
      if (params[:tutor][:current_location])
        params[:tutor][:current_location][:other] ||= JSON.parse(@tutor.current_location)[:other]
        params[:tutor][:current_location] = (params[:current_location]).to_json

        params[:tutor].delete :subjects if params[:tutor][:subjects]
      end
      params.fetch(:tutor, {}).permit!
    end
end
