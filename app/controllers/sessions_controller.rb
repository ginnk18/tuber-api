class SessionsController < ApplicationController
  def create
    data = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    Rails.logger.error params.to_yaml
    user = User.where(email: params[:email]).first
    head 406 and return unless user
    if user.authenticate(params[:password])
      user.regenerate_token
      this_user = user.tutor || user.student
      this_user.email = user.email
      if user.student_or_tutor == "tutor"
        this_user.status_code = 1
        location = JSON.parse(this_user.current_location)
        this_user.current_location = {country: location["country"],
                                      city: location["city"],
                                      long: params['long'],
                                      lat: params['lat'],
                                      other: location["other"]}.to_json
        this_user.save
        render json: this_user,
               include: {:user => {only: :token}},
               status: :created,
               meta: default_meta and return
      else
         render json: this_user,
               include: {:user => {only: :token}},
               status: :created,
               meta: default_meta and return
      end
    end
    head 403
  end

  def destroy
    token = params[:id]
    user = User.where(token: token).first
    head 404 and return unless user
    this_user = user.tutor || user.student
    user.regenerate_token
    user.tutor.update({status_code: 3});
    head 204
  end
end