c1 = Cat.create(name: "Moe", breed: "Tabby", weight: "fat", temperament: "protective")
c2 = Cat.create(name: "Ciprian", breed: "Calico", weight: "skinny", temperament: "friendly")
c3 = Cat.create(name: "Sparky", breed: "dog", weight: "average", temperament: "confused")

h1 = Hobby.create(name: "eating")
h2 = Hobby.create(name: "playing")

CatHobby.create(cat: c1, hobby: h1)
CatHobby.create(cat: c2, hobby: h2)
CatHobby.create(cat: c2, hobby: h2)
CatHobby.create(cat: c3, hobby: h2)
CatHobby.create(cat: c3, hobby: h1)