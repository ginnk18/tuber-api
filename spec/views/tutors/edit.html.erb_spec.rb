require 'rails_helper'

RSpec.describe "tutors/edit", type: :view do
  before(:each) do
    @tutor = assign(:tutor, Tutor.create!())
  end

  it "renders the edit tutor form" do
    render

    assert_select "form[action=?][method=?]", tutor_path(@tutor), "post" do
    end
  end
end
