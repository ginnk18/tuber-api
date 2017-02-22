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

## USERS

puts "Creating Users ..."

User.create(email: 'scrub1@scrub.com', student_or_tutor: "tutor", password: "test")
User.create(email: 'scrub2@scrub.com', student_or_tutor: "tutor", password: "test")
User.create(email: 'scrub3@scrub.com', student_or_tutor: "tutor", password: "test")
User.create(email: 'scrub4@scrub.com', student_or_tutor: "tutor", password: "test")
User.create(email: 'scrub5@scrub.com', student_or_tutor: "student", password: "test")
User.create(email: 'scrub6@scrub.com', student_or_tutor: "student", password: "test")
User.create(email: 'scrub7@scrub.com', student_or_tutor: "student", password: "test")
User.create(email: 'scrub8@scrub.com', student_or_tutor: "student", password: "test")
User.create(email: 'scrub9@scrub.com', student_or_tutor: "student", password: "test")

## CATEGORIES

puts "Creating Subjects ..."

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
             education:        'BA Sociology',
             experience:       '5 years tutoring',
             email:            'blah@blah.com',
             phone:            14037709052,
             hours:            "{m: '9-5', tu: '9-5', we: '9-5', th: '9-5', fr: '9-5', sa: '9-5', su: '9-5'}",
             rate_cents:       3000,
             current_location: "{country: 'Canada', city: 'Calgary', long: 100, lat: 60}",
             is_available:     false,
             subjects_taught:  [3, 7],
             avatar:           'assets/images/default_profile_images_default_profile_6_400x400.png'
            )

Tutor.create(name:             'Biff Clay',
             education:        'BSc Computer Science',
             experience:       '5 years tutoring',
             email:            'blah2@blah2.com',
             phone:            14037709052,
             hours:            "{m: '9-5', tu: '9-5', we: '9-5', th: '9-5', fr: '9-5', sa: '9-5', su: '9-5'}",
             rate_cents:       4000,
             current_location: "{country: 'Canada', city: 'Calgary', long: 100, lat: 60}",
             is_available:     false,
             subjects_taught:  [6, 15],
             avatar:           'assets/images/default_profile_images_default_profile_6_400x400.png'
            )

Tutor.create(name:             'Zinat Agresta',
             education:        'BSc Chemistry',
             experience:       '5 years tutoring',
             email:            'blah3@blah.com',
             phone:            14037709052,
             hours:            "{m: '9-5', tu: '9-5', we: '9-5', th: '9-5', fr: '9-5', sa: '9-5', su: '9-5'}",
             rate_cents:       3500,
             current_location: "{country: 'Canada', city: 'Calgary', long: 100, lat: 60}",
             is_available:     false,
             subjects_taught:  [3, 7],
             avatar:           'assets/images/default_profile_images_default_profile_6_400x400.png'
            )

Tutor.create(name:             'Frederik Campbell',
             education:        'Engineering',
             experience:       '5 years tutoring',
             email:            'blah4@blah.com',
             phone:            14037709052,
             hours:            "{m: '9-5', tu: '9-5', we: '9-5', th: '9-5', fr: '9-5', sa: '9-5', su: '9-5'}",
             rate_cents:       3000,
             current_location: "{country: 'Canada', city: 'Calgary', long: 100, lat: 60}",
             is_available:     false,
             subjects_taught:  [3, 7],
             avatar:           'assets/images/default_profile_images_default_profile_6_400x400.png'
            )

Tutor.create(name:             'Otávio Beránek',
             education:        'BSc Computer Science',
             experience:       '5 years tutoring',
             email:            'blah5@blah.com',
             phone:            14037709052,
             hours:            "{m: '9-5', tu: '9-5', we: '9-5', th: '9-5', fr: '9-5', sa: '9-5', su: '9-5'}",
             rate_cents:       3000,
             current_location: "{country: 'Canada', city: 'Calgary', long: 100, lat: 60}",
             is_available:     false,
             subjects_taught:  [3, 7],
             avatar:           'assets/images/default_profile_images_default_profile_6_400x400.png'
            )

Tutor.create(name:             'Berry Jakobsen',
             education:        'BSc Computer Science',
             experience:       '5 years tutoring',
             email:            'blah6@blah.com',
             phone:            14037709052,
             hours:            "{m: '9-5', tu: '9-5', we: '9-5', th: '9-5', fr: '9-5', sa: '9-5', su: '9-5'}",
             rate_cents:       3000,
             current_location: "{country: 'Canada', city: 'Calgary', long: 100, lat: 60}",
             is_available:     false,
             subjects_taught:  [3, 7],
             avatar:           'assets/images/default_profile_images_default_profile_6_400x400.png'
            )

Tutor.create(name:             'Pyrrhos Pontecorvo',
             education:        'BSc Computer Science',
             experience:       '5 years tutoring',
             email:            'blah7@blah.com',
             phone:            14037709052,
             hours:            "{m: '9-5', tu: '9-5', we: '9-5', th: '9-5', fr: '9-5', sa: '9-5', su: '9-5'}",
             rate_cents:       3000,
             current_location: "{country: 'Canada', city: 'Calgary', long: 100, lat: 60}",
             is_available:     false,
             subjects_taught:  [3, 7],
             avatar:           'assets/images/default_profile_images_default_profile_6_400x400.png'
            )

Tutor.create(name:             'Ealasaid Spooner',
             education:        'BSc Computer Science',
             experience:       '5 years tutoring',
             email:            'blah8@blah.com',
             phone:            14037709052,
             hours:            "{m: '9-5', tu: '9-5', we: '9-5', th: '9-5', fr: '9-5', sa: '9-5', su: '9-5'}",
             rate_cents:       3000,
             current_location: "{country: 'Canada', city: 'Calgary', long: 100, lat: 60}",
             is_available:     false,
             subjects_taught:  [3, 7],
             avatar:           'assets/images/default_profile_images_default_profile_6_400x400.png'
            )

Tutor.create(name:             'Pauleen Blum',
             education:        'BSc Computer Science',
             experience:       '5 years tutoring',
             email:            'blah9@blah.com',
             phone:            14037709052,
             hours:            "{m: '9-5', tu: '9-5', we: '9-5', th: '9-5', fr: '9-5', sa: '9-5', su: '9-5'}",
             rate_cents:       3000,
             current_location: "{country: 'Canada', city: 'Calgary', long: 100, lat: 60}",
             is_available:     false,
             subjects_taught:  [3, 7],
             avatar:           'assets/images/default_profile_images_default_profile_6_400x400.png'
            )

## STUDENTS

puts "Creating students ..."

Student.destroy_all

Student.create(name: "Tomiko Sheach", email: 'student1@student.student', current_location: '{long: 100, lat: 60}')
Student.create(name: "Masamba Tiraboschi", email: 'student2@student.student', current_location: '{long: 100, lat: 60}')
Student.create(name: "Lynsey Adam", email: 'student3@student.student', current_location: '{long: 100, lat: 60}')
Student.create(name: "Hilde Gage", email: 'student4@student.student', current_location: '{long: 100, lat: 60}')
Student.create(name: "Oliwia Valenti", email: 'student5@student.student', current_location: '{long: 100, lat: 60}')
Student.create(name: "Democritus Cavanagh", email: 'student6@student.student', current_location: '{long: 100, lat: 60}')
Student.create(name: "Reut Moonrain", email: 'student7@student.student', current_location: '{long: 100, lat: 60}')
Student.create(name: "Silke Kravitz", email: 'student8@student.student', current_location: '{long: 100, lat: 60}')
Student.create(name: "Tahvo O'Leary", email: 'student9@student.student', current_location: '{long: 100, lat: 60}')
Student.create(name: "Seema Haraldsson", email: 'student10@student.student', current_location: '{long: 100, lat: 60}')

## REVIEWS

puts "Creating reviews ..."

Review.destroy_all

Review.create(student_id: 1, tutor_id: 1, content: 'great', rating: 4)

puts "DONE!"
