puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
# unless Rails.env.development?
#   puts "Development seeds only (for now)!"
#   exit 0
# end

# Let's do this ...
puts 'building the factories'

CITIES = ["Calgary", "Edmonton", "Hamilton",
          "Kitchener", "Montreal", "Ottawa",
          "Quebec City", "Toronto", "Vancouver",
          "Winnipeg"]

CITY_LOCATIONS = {"Calgary": {lat: 51.0486, long: -114.0708},
              "Edmonton": {lat: 53.5444, long: -113.4909},
              "Hamilton": {lat: 43.2557, long: -79.8711},
              "Kitchener": {lat: 43.4503, long: -80.4832},
              "Montreal": {lat: 45.5017, long: -73.5673},
              "Ottawa": {lat: 45.4215, long: 75.6972},
              "Quebec City": {lat: 46.8139, long: -71.2080},
              "Toronto": {lat: 43.6532, long: -79.3832},
              "Vancouver": {lat: 49.2827, long: -123.1207},
              "Winnipeg": {lat: 49.8951, long: -97.1384}}

def create_user(id)
  User.create!(
    description:      Faker::Hipster.paragraph(5),
    email:            id.to_s + Faker::Internet.free_email,
    student_or_tutor: ["student", "tutor"].sample,
    password:         "test"
  )
end

def create_subject(subject)
  Subject.create!(name: subject)
end

def create_tutor(u_id)
  Tutor.create!(
    name:             Faker::Name.name,
    education:        Faker::Educator.course,
    experience:       "#{1 + rand(30)} years tutoring",
    phone:            "#{400 + rand(280)}-#{100 + rand(899)}-#{2000 + rand(7999)}",
    hours:            { mon: [[9, 17]], tue: [[9, 17]], wed: [[9, 17]], thu: [[9, 17]], fri: [[9, 17]], sat: [[9, 17]], sun: [[9, 17]]}.to_json,
    rate_cents:       rand(100) * 100,
    current_location: {
                        country: 'Canada',
                        city: CITIES.sample,
                        long: 50 + (rand(900_000) / 10_000.0),
                        lat: 50 + (rand(300_000) / 10_000.0),
                        other: Faker::Address.street_address
                      }.to_json,
    status_code:     [*1..3].sample,
    avatar:           Faker::LoremPixel.image,
    user_id:          u_id
  )
end

def create_student(u_id)
  Student.create!(
    name:             Faker::Name.name,
    current_location: {
                        country: 'Canada',
                        city: CITIES.sample,
                        long: 50 + (rand(900_000) / 10_000.0),
                        lat: 50 + (rand(300_000) / 10_000.0),
                        other: Faker::Address.street_address
                      }.to_json,
    avatar:           Faker::Avatar.image,
    user_id:          u_id
  )
end

def create_review(t_id, s_id)
  Review.create!(
    tutor_id:   t_id,
    student_id: s_id,
    content:    Faker::Hipster.paragraph(4),
    rating:     1 + rand(4)
  )
end

## Destroying existing records
puts "Destroying old reviews"
Review.destroy_all

puts "Destroying old students"
Student.destroy_all

puts "Destroying old tutors"
Tutor.destroy_all

puts "Destroying old subjects"
Subject.destroy_all

puts "Destroying old users"
User.destroy_all

## USERS
puts "Creating Users ..."
200.times { |email_id| create_user email_id }

## SUBJECTS
puts "Creating Subjects ..."
SUBJECTS = [
  'Visual Arts', 'Geography', 'History',
  'Literature', 'Philosophy', 'Economics',
  'Law', 'Political science', 'Psychology',
  'Sociology', 'Biology', 'Chemistry',
  'Earth and space sciences', 'Mathematics',
  'Physics', 'Agriculture', 'Computer science',
  'Engineering', 'Medicine'
]
SUBJECTS.each { |s| create_subject(s) }


## TUTORS and STUDENTS
puts "Creating Tutors and Students..."
User.all.each do |user|
  if user.student_or_tutor == "tutor"
    create_tutor(user.id)
  else
    create_student(user.id)
  end
end

Tutor.all.each do |tutor|
  subjects = []
  (rand(4)+1).times do
      subjects.push(Subject.all.sample)
  end
  tutor.subjects = subjects.uniq
end

## REVIEWS
puts "Creating reviews ..."
tutors = Tutor.all.pluck(:id).to_a
p tutors.take(5)
students = Student.all.pluck(:id).to_a
tutors.product(students).each do |tutor_id, student_id|
  create_review(tutor_id, student_id) if [true, false].sample
end

puts "DONE!"
