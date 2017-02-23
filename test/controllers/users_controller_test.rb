require 'test_helper'
require 'json'

class UsersControllerTest < ActionController::TestCase


  # test "Should get valid list of users" do
  #   get :index
  #   assert_response :success
  #   assert_equal response.content_type, 'application/json'
  #   jdata = JSON.parse response.body
  #   assert_equal jdata[0]['type'], 'users'
  # end

  test "Should get valid user data" do
    get :show, params: { id: 338193910 }
    assert_response :success
    jdata = JSON.parse response.body
  end

  test "Should get JSON:API error block when requesting user data with invalid ID" do
    get :show, params: { id: "z" }
    assert_response 404
  end

  test "Should be able to create tutor user with valid params" do
    get :create, params: { name:             'Tutor Test',
                           education:        'BA Whatevs',
                           experience:       'One million years tutoring',
                           email:            'blah@blah.com',
                           phone:            '14037709052',
                           hours:            "{m: '9-5', tu: '9-5', we: '9-5', th: '9-5', fr: '9-5', sa: '9-5', su: '9-5'}",
                           rate_cents:       3000,
                           current_location: "{country: 'Canada', city: 'Calgary', long: 100, lat: 60}",
                           is_available:     false,
                           subjects_taught:  [3, 7],
                           avatar:           'assets/images/default_profile_images_default_profile_6_400x400.png',
                           password:         'test_pass',
                           student_or_tutor: 'tutor',
                          }
    assert_response :success
  end

  test "Should be able to create student user with valid params" do
    get :create, params: { student_or_tutor: 'student',
                           email: "studtest@studtest.com",
                           name: "Student Test",
                           password: "test_pass"
                         }

    assert_response :success
  end
end