user01 = User.create( username: "Albert", password_hash: "Albert")
user02 = User.create( username: "Bertha", password_hash: "Bertha")

survey01 = Survey.create(title: "Test Survey 01", description: "A test survey.", user_id: user01.id )

survey01.questions.create(text: "What is your favorite color?")
survey01.questions.create( text: "What is your favorite number?")
survey01.questions.create( text: "How many meals do you eat a day?")

survey01.questions[0].choices.create(text: "red")
survey01.questions[1].choices.create(text: "3")
survey01.questions[2].choices.create(text: "2")

Response.create(user_id: user01.id, survey_id: survey01.id)

