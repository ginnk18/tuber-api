require 'rails_helper'

RSpec.describe "subjects/show", type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
