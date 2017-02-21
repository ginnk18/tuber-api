# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Subjects ..."

sub1 = Subject.find_or_create_by! name: 'Visual Arts'
sub2 = Subject.find_or_create_by! name: 'Geography'
sub3 = Subject.find_or_create_by! name: 'History'
sub4 = Subject.find_or_create_by! name: 'Literature'
sub5 = Subject.find_or_create_by! name: 'Philosophy'
sub6 = Subject.find_or_create_by! name: 'Economics'
sub7 = Subject.find_or_create_by! name: 'Law'
sub8 = Subject.find_or_create_by! name: 'Political science'
sub9 = Subject.find_or_create_by! name: 'Psychology'
sub10 = Subject.find_or_create_by! name: 'Sociology'
sub11 = Subject.find_or_create_by! name: 'Biology'
sub12 = Subject.find_or_create_by! name: 'Chemistry'
sub13 = Subject.find_or_create_by! name: 'Earth and space sciences'
sub14 = Subject.find_or_create_by! name: 'Mathematics'
sub15 = Subject.find_or_create_by! name: 'Physics'
sub16 = Subject.find_or_create_by! name: 'Agriculture'
sub17 = Subject.find_or_create_by! name: 'Computer science'
sub18 = Subject.find_or_create_by! name: 'Engineering'
sub19 = Subject.find_or_create_by! name: 'Medicine'

## PRODUCTS

puts "Creating Tutors ..."

Tutor.destroy_all

Tutor.create(name:             'Julio Coolio',
             education:        'BSc Computer Science',
             experience:       '5 years tutoring',
             email:            'blah@blah.com',
             phone:            14037709052,
             hours:            "{m: '9-5', tu: '9-5', we: '9-5', th: '9-5', fr: '9-5', sa: '9-5', su: '9-5'}",
             rate_cents:       3000,
             current_location: "{country: 'Canada', city: 'Calgary', long: 100, lat: 60}",
             is_available:     false,
             subjects_taught:  [3, 7],
             password_hash:    'u2n340523',
             avatar:           'avatar1.jpg'
            )

## STUDENTS

puts "Creating students ..."

Student.create(name: "Needs 2pass", email: 'student@student.student', current_location: '{long: 100, lat: 60}')

## REVIEWS

puts "Creating reviews ..."

Review.create(student_id: 1, tutor_id: 1, content: 'great', rating: 4)

puts "DONE!"
