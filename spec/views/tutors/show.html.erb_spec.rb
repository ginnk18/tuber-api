require 'rails_helper'

RSpec.describe "tutors/show", type: :view do
  before(:each) do
    @tutor = assign(:tutor, Tutor.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
