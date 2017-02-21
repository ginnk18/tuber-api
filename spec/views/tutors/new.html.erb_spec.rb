require 'rails_helper'

RSpec.describe "tutors/new", type: :view do
  before(:each) do
    assign(:tutor, Tutor.new())
  end

  it "renders new tutor form" do
    render

    assert_select "form[action=?][method=?]", tutors_path, "post" do
    end
  end
end
