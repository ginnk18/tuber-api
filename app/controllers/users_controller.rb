class UsersController < ApplicationController

  # before_action :validate_user, only: [:create, :update, :destroy]
  # before_action :validate_type, only: [:create, :update]

  CITY_LOCATIONS = {"Calgary": {lat: 51.0486, long: -114.0708},
                    "Edmonton": {lat: 53.5444, long: -113.4909},
                    "Hamilton": {lat: 43.2557, long: -79.8711},
                    "Kitchener": {lat: 43.4503, long: -80.4832},
                    "Montreal": {lat: 45.5017, long: -73.5673},
                    "Ottawa": {lat: 45.4215, long: 75.6972},
                    "Quebec City": {lat: 46.8139, long: -71.2080},
                    "Toronto": {lat: 43.6532, long: -79.3832},
                    "Vancouver": {lat: 49.2827, long: -123.1207},
                    "Winnipeg": {lat: 49.8951, long: -97.1384}}

  def index
    users = User.all
    render json: users
  end

  def create
    new_user_params = {password_digest: BCrypt::Password.create(params['password']),
                   token: SecureRandom.base58(24),
                   email: params['email'],
                   student_or_tutor: params['student_or_tutor'],
                   description: "I hold a PhD and specialize in Twentieth Century history. Currently, I tutor both university and high school students who want to improve their essay writing or need help with concepts as they prepare for exams."}
    user = User.new(new_user_params)
    puts 'here 1'
    if user.save
      puts 'here 2'
      if user.student_or_tutor == 'tutor'
        # SAVE TUTOR INFO
        puts 'here 3'
        puts params.inspect
        puts 'here 3.5'
        puts params['city']
        puts 'here 3.7'
        tutor = Tutor.new(name:             params['name'],
                          education:        params['education'],
                          experience:       params['experience'],
                          email:            params['email'],
                          phone:            params['phone'],
                          hours:            params['hours'],
                          rate_cents:       params['rate_cents'],
                          status_code:      "1",
                          current_location: {country: "Canada",
                                             city: params['city'],
                                             long: CITY_LOCATIONS[params['city'].to_sym][:long],
                                             lat: CITY_LOCATIONS[params['city'].to_sym][:lat],
                                             other: "other stuff about location"}.to_json,
                          avatar:           params['avatar'],
                          user_id:          user['id']
        )
        puts 'here 4'
        params['subjects'].each do |subject|
          tutor.subjects << Subject.where(name: subject)
        end
        puts 'here 5'
        tutor.save
        render json: {status: "User successfully created", user: tutor},
               include: {:user => {only: :token}},
               status: :created
      else
        # SAVE STUDENT INFO

        # Adds some default for development - to figure out what to do in production
        params['name'] ||= Faker::Name.name
        params['avatar'] ||= Faker::Avatar.image
        params['current_location'] ||= {
                        country: 'Canada',
                        city: Faker::Address.city,
                        long: 50 + (rand(900_000) / 10_000.0),
                        lat: 50 + (rand(300_000) / 10_000.0),
                        other: Faker::Address.street_address
                      }.to_json
        student = Student.new(name: params['name'],
                              email: params['email'],
                              user_id: user['id'],
                              current_location: params['current_location']
        )
        student.save
        render json: {status: "User successfully created", user: student},
             include: {:user => {only: :token}},
             status: :created
      end

    else
      render json: { errors: user.errors.full_messages },
             include: {:user => {only: :token}},
             status: :bad_request
    end
  end

  def show
    puts 'user_params: ' + params.inspect
    id = params['id']
    puts 'id: ' + id.to_s
    user = User.find(id)
    puts 'user: ' + user.inspect
    if user
      render json: user
    else
      head 404
    end
  end

  def update
    if @user.update_attributes(user_params)
      render json: @user, status: :ok
    else
      render_error(@user, :unprocessable_entity)
    end
  end

  def destroy
    @user.destroy
    head 204
  end

  def login
    user = User.find_by(email: params[:email].to_s.downcase)

    if user && user.authenticate(params[:password])
        auth_token = JsonWebToken.encode({user_id: user.id})
        render json: {auth_token: auth_token}, status: :ok
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  private

  def user_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

end
