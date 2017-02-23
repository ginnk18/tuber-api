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
                   student_or_tutor: params['student_or_tutor']}
    user = User.new(new_user_params)
    if user.save
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
      else
        # SAVE STUDENT INFO
        student = Student.new(name: params['name'],
                              email: params['email'],
                              user_id: user['id'],
                              )
        student.save
      end
      render json: user, status: :created
    else
      head 400
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

  private

  def user_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

end
