require 'rails_helper'

RSpec.describe "subjects/index", type: :view do
  before(:each) do
    assign(:subjects, [
      Subject.create!(),
      Subject.create!()
    ])
  end

  it "renders a list of subjects" do
    render
  end
end
