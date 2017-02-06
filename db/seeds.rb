User.delete_all
List.delete_all
Task.delete_all

ben = User.create({
  username: "benjimon",
  email: "benji102491@gmail.com",
  password: "asdf1234"
  })

list1 = ben.lists.create({
  title: "Weekend Errands",
  })


list1.tasks.create({
  description: "Stop zombie apocalypse"
  })

list1.tasks.create({
  description: "Shut down SkyNet"
  })

list1.tasks.create({
  description: "Redirect catastrophic meteorite"
  })

list1.tasks.create({
  description: "Visit grandparents"
  })

list2 = ben.lists.create({
    title: "Monday Workout",
    })

list2.tasks.create({
  description: "Run 40 laps around the Sun"
  })

list2.tasks.create({
  description: "Do 500 Earth-Push-Downs"
  })

list2.tasks.create({
  description: "Pectoral Flies to Clear the Skies"
  })
