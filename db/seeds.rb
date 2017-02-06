require "faker"

User.delete_all
List.delete_all
Task.delete_all

user = User.create(
    username: "admin", 
    email: "admin@test.com", 
    password: "password")

user.lists.create([
    { name: "work" }
    ])

user.lists.first.tasks.create(
    name: "Finish final project",
    due_date: DateTime.parse('3rd Feb 2017 04:05:06 PM'),
    user_id: 1
    )
    
# DateTime.new(YYYY, MM, DD, HH, MM)
# DateTime.parse('3rd Feb 2017 04:05:06 PM')





