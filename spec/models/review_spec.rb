require 'rails_helper'

def generate_review_attr
  review_attr = {
    student: Student.create(name: "Tomiko Sheach",
                            email: 'student1@student.student',
                            current_location: '{long: 100, lat: 60}',
                            avatar: '/images/default_profile_images_default_profile_6_400x400.png'),
    tutor: Tutor.create(name:             'Biff Clay',
             education:        'BSc Computer Science',
             experience:       '5 years tutoring',
             email:            'blah2@blah2.com',
             phone:            14037709052,
             hours:            "{m: '9-5', tu: '9-5', we: '9-5', th: '9-5', fr: '9-5', sa: '9-5', su: '9-5'}",
             rate_cents:       4000,
             current_location: "{country: 'Canada', city: 'Calgary', long: 100, lat: 60}",
             is_available:     false,
             subjects_taught:  [6, 15],
             avatar:           '/images/default_profile_images_default_profile_6_400x400.png'
            ),
    content: Faker::Hipster.paragraph(3),
    rating: 1 + rand(4)
  }
end

RSpec.describe Review, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before(:each) do
      @old_count = Review.count
      @review_attr = generate_review_attr
    end

    context "with all attributes present" do
      
      it "expects successful review save " do
        review = Review.new(@review_attr)
        expect(review.save).to be true
      end
    end

    # context "with name attributes nil" do
    #   @review_attr[:name] = nil
    #   review = Review.new(@review_attr)

    #   it "expects failing review save " do
    #     expect(review.save).to be false
    #     expect(review.errors.full_messages).to include("Name can't be blank")
    #     expect(Review.count).to eql(@old_count)
    #   end
    # end

    # context "with category attributes nil" do
    #   @review_attr[:category] = nil
    #   review = Review.new(@review_attr)
      
    #   it "expects failing review save " do
    #     expect(review.save).to be false
    #     expect(review.errors.full_messages).to include("Category can't be blank")
    #     expect(Review.count).to eql(@old_count)
    #   end
    # end

    # context "with price attributes nil" do
    #   @review_attr[:price] = nil
    #   review = Review.new(@review_attr)
      
    #   it "expects failing review save " do
    #     expect(review.save).to be false
    #     expect(review.errors.full_messages).to include("Price can't be blank")
    #     expect(Review.count).to eql(@old_count)
    #   end
    # end

    # context "with quantity attributes nil" do
    #   @review_attr[:quantity] = nil
    #   review = Review.new(@review_attr)
      
    #   it "expects failing review save " do
    #     expect(review.save).to be false
    #     expect(review.errors.full_messages).to include("Quantity can't be blank")
    #     expect(Review.count).to eql(@old_count)
    #   end
    # end
  end
end
