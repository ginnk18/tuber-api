require "rails_helper"

RSpec.describe TutorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tutors").to route_to("tutors#index")
    end

    it "routes to #new" do
      expect(:get => "/tutors/new").to route_to("tutors#new")
    end

    it "routes to #show" do
      expect(:get => "/tutors/1").to route_to("tutors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tutors/1/edit").to route_to("tutors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tutors").to route_to("tutors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tutors/1").to route_to("tutors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tutors/1").to route_to("tutors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tutors/1").to route_to("tutors#destroy", :id => "1")
    end

  end
end
