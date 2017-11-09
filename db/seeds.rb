User.create!(
  email: "toto@gmail.com",
  password: "azertyuiop",
  first_name: "Toto",
  last_name: "T",
  address: "5333 avenue Casgrain, Montreal"
  )


User.create!(
  email: "foo@gmail.com",
  password: "azertyuiop",
  first_name: "Foo",
  last_name: "f",
  address: "1234 boulevard Saint Laurent, Montreal"
  )


User.create!(
  email: "hello@gmail.com",
  password: "azertyuiop",
  first_name: "Hello",
  last_name: "H",
  address: "Complexe Desjardins, Montreal"
  )


Skill.create!(
  name: "Coding",
  description: "HTML, CSS, Javascript"
  user_id: User.find_by(email: "toto@gmail.com").id
  )

Skill.create!(
  name: "Meditation",
  description: "Yoga, zen classes"
  user_id: User.find_by(email: "toto@gmail.com").id
  )

Skill.create!(
  name: "Dog grooming",
  description: "Spa for your dog"
  user_id: User.find_by(email: "toto@gmail.com").id
  )

Skill.create!(
  name: "Accounting",
  description: "Pay less taxes"
  user_id: User.find_by(email: "foo@gmail.com").id
  )

Skill.create!(
  name: "Bartending",
  description: "Learn to make perfect cocktails"
  user_id: User.find_by(email: "foo@gmail.com").id
  )

Skill.create!(
  name: "Cooking",
  description: "Learn how to become a chef"
  user_id: User.find_by(email: "foo@gmail.com").id
  )


Skill.create!(
  name: "Fitness training",
  description: "Make your body feel good"
  user_id: User.find_by(email: "hello@gmail.com").id
  )
