require 'rails_helper'

RSpec.describe "tutors/index", type: :view do
  before(:each) do
    assign(:tutors, [
      Tutor.create!(),
      Tutor.create!()
    ])
  end

  it "renders a list of tutors" do
    render
  end
end
