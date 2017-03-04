class UsersController < ApplicationController

  # before_action :validate_user, only: [:create, :update, :destroy]
  # before_action :validate_type, only: [:create, :update]

  def index
    users = User.all
    render json: users
  end

  def create
    new_user_params = {password_digest: BCrypt::Password.create(params['password']),
                   token: SecureRandom.base58(24),
                   email: params['email'],
                   student_or_tutor: params['student_or_tutor'],
                   description: "some placeholder description till we figure out what to do"}
    user = User.new(new_user_params)
    if user.save
      puts 'student_or_tutor'
      puts user.student_or_tutor
      if user.student_or_tutor == 'tutor'
        # SAVE TUTOR INFO
        tutor = Tutor.new(name:             params['name'],
                          education:        params['education'],
                          experience:       params['experience'],
                          email:            params['email'],
                          phone:            params['phone'],
                          hours:            params['hours'],
                          rate_cents:       params['rate_cents'],
                          current_location: params['current_location'],
                          is_available:     params['is_available'],
                          subjects_taught:  params['subjects_taught'],
                          avatar:           params['avatar'],
                          user_id:          user['id']
        )
        tutor.save
        render json: {status: "User successfully created", user: tutor}, status: :created
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
