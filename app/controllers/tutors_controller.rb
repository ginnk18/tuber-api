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
    set_tutor
    if @tutor.update(tutor_params)
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
      params.fetch(:tutor, {})
    end
end
