# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "test@test.com", password: "asdfasdf",password_confirmation: "asdfasdf")
User.create(email: "test1@test.com", password: "asdfasdf",password_confirmation: "asdfasdf")
Company.create(name: "Company A")
CompanyProject.create!(project: "project A", company_id: Company.first.id)
Task.create(description: "asdfasdf", company_project_id: Company.first.id)
TaskWork.create(time_worked: DateTime.now, user_id: User.first.id, task_id: Task.last.id)
TaskWork.create(time_worked: DateTime.now, user_id: User.last.id, task_id: Task.last.id)
