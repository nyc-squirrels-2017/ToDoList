User.destroy_all
List.destroy_all
Task.destroy_all

user = User.create! [
  {username: "joyce", email: "joyce@gmail.com", password: "123456"}
]

5.times {|index| List.create! name: "List #{index}", user_id: 1}

List.all.each do |list|
  list.tasks.create! [
    {task: "Task 1", completed: false},
    {task: "Task 2", completed: false},
    {task: "Task 3", completed: false}
  ]
end

List.all.each do |list|
  list.user
  list.save!
end
