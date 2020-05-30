
user1 = User.create!(email: "i@i.com", password:'123456', role: "superadmin", name: "Italo Fasanelli")
user2 = User.create!(email: "m@m.com", password:'123456', role: "admin", name: "Mariana Santana")
user3 = User.create!(email: "a@a.com", password:'123456', role: "visitor", name: "Antonella Fasanelli")



cuisine1 = Cuisine.create!(name:'Italiana')
cuisine2 = Cuisine.create!(name:'Japonesa')
cuisine3 = Cuisine.create!(name:'Churrascaria')



restaurant1 = Restaurant.create!(name: 'Coza Nostra', address: 'Rua Maria Máximo, 59', neighborhood: 'Ponta da Praia', city: 'Santos', status: 0, phone: '13 3327-1331', phone2: '13 3327-1313', cost: 129.99, timmings: 'Seg-Qui 11h às 22h, Sex-Sáb 11h 0h & Dom 11h às 16h', happy_hour: 'Não tem', coffee: true, delivery: true, ac: true, wifi: true, cards: true, tickets: true, outside: true, club: true, vegetarian: true, cuisine_id: cuisine1.id, map: "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3645.367049318202!2d-46.30487798531784!3d-23.982812383175045!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce023fbd79cbbb%3A0x65699e571d31437c!2sCondom%C3%ADnio%20Edif%C3%ADcio%20Santa%20Cruz%20-%20Rua%20Maria%20M%C3%A1ximo%2C%2059%20-%20Ponta%20da%20Praia%2C%20Santos%20-%20SP%2C%2011030-100!5e0!3m2!1spt-BR!2sbr!4v1586460553236!5m2!1spt-BR!2sbr")
restaurant1.pictures.attach(io: File.open('app/assets/images/i1.jpg'), filename: 'i1.jpg', content_type: 'image/jpg')
restaurant1.pictures.attach(io: File.open('app/assets/images/i2.jpg'), filename: 'i2.jpg', content_type: 'image/jpg')
restaurant1.pictures.attach(io: File.open('app/assets/images/i3.jpg'), filename: 'i3.jpg', content_type: 'image/jpg')
restaurant1.pictures.attach(io: File.open('app/assets/images/i4.jpg'), filename: 'i4.jpg', content_type: 'image/jpg')
restaurant1.pictures.attach(io: File.open('app/assets/images/i5.jpg'), filename: 'i5.jpg', content_type: 'image/jpg')
restaurant1.pictures.attach(io: File.open('app/assets/images/i6.jpg'), filename: 'i6.jpg', content_type: 'image/jpg')
restaurant1.menus.attach(io: File.open('app/assets/images/i7.jpg'), filename: 'i7.jpg', content_type: 'image/jpg')

restaurant2 = Restaurant.create!(name: 'Hatori', address: 'Rua Japão, 13', neighborhood: 'Estuário', city: 'Santos', status: 0, phone: '13 3227-1331', phone2: '13 3227-1313', cost: 89.99, timmings: 'Seg-Sáb 11h às 22h & Dom 11h às 16h', happy_hour: 'Não tem', coffee: true, delivery: true, ac: true, wifi: true, cards: true, tickets: true, outside: true, club: true, vegetarian: true, cuisine_id: cuisine2.id, map: "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3645.8829750301725!2d-46.30856638531824!3d-23.96457798249032!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce03b51735155f%3A0x56a197c9ac2fb68!2sR.%20Jap%C3%A3o%2C%2013%20-%20Estu%C3%A1rio%2C%20Santos%20-%20SP%2C%2011020-200!5e0!3m2!1spt-BR!2sbr!4v1586460684621!5m2!1spt-BR!2sbr")
restaurant2.pictures.attach(io: File.open('app/assets/images/j1.jpg'), filename: 'j1.jpg', content_type: 'image/jpg')
restaurant2.pictures.attach(io: File.open('app/assets/images/j2.jpg'), filename: 'j2.jpg', content_type: 'image/jpg')
restaurant2.pictures.attach(io: File.open('app/assets/images/j3.jpg'), filename: 'j3.jpg', content_type: 'image/jpg')
restaurant2.pictures.attach(io: File.open('app/assets/images/j4.jpg'), filename: 'j4.jpg', content_type: 'image/jpg')
restaurant2.pictures.attach(io: File.open('app/assets/images/j5.jpg'), filename: 'j5.jpg', content_type: 'image/jpg')
restaurant2.pictures.attach(io: File.open('app/assets/images/j6.jpg'), filename: 'j6.jpg', content_type: 'image/jpg')
restaurant2.pictures.attach(io: File.open('app/assets/images/j7.jpg'), filename: 'j7.jpg', content_type: 'image/jpg')
restaurant2.menus.attach(io: File.open('app/assets/images/j8.jpg'), filename: 'j8.jpg', content_type: 'image/jpg')

restaurant3 = Restaurant.create!(name: 'Brazilian Steakhouse', address: 'Rua Brasília, 13', neighborhood: 'Gonzaga', city: 'Santos', status: 0, phone: '13 3337-1331', phone2: '13 3337-1313', cost: 79.99, timmings: 'Seg-Qui 11h às 22h, Sex-Sáb 11h 23h & Dom 11h às 16h', happy_hour: 'Qui 18h às 20h', coffee: true, delivery: true, ac: true, wifi: true, cards: true, tickets: true, outside: true, club: true, vegetarian: true, cuisine_id: cuisine3.id, map: "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3645.936347718436!2d-46.33313868531825!3d-23.96269088241947!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce030e5573507d%3A0x63baf45ffb0d427f!2sR.%20Bras%C3%ADlia%2C%2013%20-%20Gonzaga%2C%20Santos%20-%20SP%2C%2011055-320!5e0!3m2!1spt-BR!2sbr!4v1586460984479!5m2!1spt-BR!2sbr")
restaurant3.pictures.attach(io: File.open('app/assets/images/b1.jpg'), filename: 'b1.jpg', content_type: 'image/jpg')
restaurant3.pictures.attach(io: File.open('app/assets/images/b2.jpg'), filename: 'b2.jpg', content_type: 'image/jpg')
restaurant3.pictures.attach(io: File.open('app/assets/images/b3.jpg'), filename: 'b3.jpg', content_type: 'image/jpg')
restaurant3.pictures.attach(io: File.open('app/assets/images/b4.jpg'), filename: 'b4.jpg', content_type: 'image/jpg')
restaurant3.pictures.attach(io: File.open('app/assets/images/b5.jpg'), filename: 'b5.jpg', content_type: 'image/jpg')
restaurant3.pictures.attach(io: File.open('app/assets/images/b6.jpg'), filename: 'b6.jpg', content_type: 'image/jpg')
restaurant3.pictures.attach(io: File.open('app/assets/images/b7.jpg'), filename: 'b7.jpg', content_type: 'image/jpg')
restaurant3.menus.attach(io: File.open('app/assets/images/b8.jpg'), filename: 'b8.jpg', content_type: 'image/jpg')




ad1 = Ad.create!(name: 'cn1', restaurant_id: restaurant1.id)
ad1.mini_ad.attach(io: File.open('app/assets/images/cn1.jpg'), filename: 'cn1.jpg', content_type: 'image/jpg')

ad3 = Ad.create!(name: 'ht1', restaurant_id: restaurant2.id)
ad3.mini_ad.attach(io: File.open('app/assets/images/ht1.jpg'), filename: 'h1.jpg', content_type: 'image/jpg')

ad5 = Ad.create!(name: 'bs1', restaurant_id: restaurant3.id)
ad5.mini_ad.attach(io: File.open('app/assets/images/bs1.jpg'), filename: 'bs1.jpg', content_type: 'image/jpg')

ad2 = Ad.create!(name: 'cn2', restaurant_id: restaurant1.id)
ad2.mini_ad.attach(io: File.open('app/assets/images/cn2.jpg'), filename: 'cn2.jpg', content_type: 'image/jpg')

ad4 = Ad.create!(name: 'ht2', restaurant_id: restaurant2.id)
ad4.mini_ad.attach(io: File.open('app/assets/images/ht2.jpg'), filename: 'ht2.jpg', content_type: 'image/jpg')

ad6 = Ad.create!(name: 'bs2', restaurant_id: restaurant3.id)
ad6.mini_ad.attach(io: File.open('app/assets/images/bs2.jpg'), filename: 'bs2.jpg', content_type: 'image/jpg')



fad1 = FullAd.create!(name: 'fcn1', restaurant_id: restaurant1.id)
fad1.fullpage_ad.attach(io: File.open('app/assets/images/fcn1.jpg'), filename: 'fcn1.jpg', content_type: 'image/jpg')

fad2 = FullAd.create!(name: 'fht1', restaurant_id: restaurant2.id)
fad2.fullpage_ad.attach(io: File.open('app/assets/images/fht1.jpg'), filename: 'fht1.jpg', content_type: 'image/jpg')

fad3 = FullAd.create!(name: 'fbs1', restaurant_id: restaurant3.id)
fad3.fullpage_ad.attach(io: File.open('app/assets/images/fbs1.jpg'), filename: 'fbs1.jpg', content_type: 'image/jpg')

comment1 = Comment.create!(body: 'Restaurante muito bom!', restaurant_id: restaurant1.id, status: 5, user_id: user1.id)
comment2 = Comment.create!(body: 'Já conheci melhores..', restaurant_id: restaurant1.id, status: 0, user_id: user2.id)
comment3 = Comment.create!(body: 'Horrível!', restaurant_id: restaurant1.id, status: 0, user_id: user3.id)
comment4 = Comment.create!(body: 'Melhor restaurante!', restaurant_id: restaurant2.id, status: 0, user_id: user1.id)
comment5 = Comment.create!(body: 'Já conheci melhores..', restaurant_id: restaurant2.id, status: 5, user_id: user2.id)
comment6 = Comment.create!(body: 'Ruim demais!', restaurant_id: restaurant2.id, status: 0, user_id: user3.id)
comment7 = Comment.create!(body: 'Maravilhoso!', restaurant_id: restaurant3.id, status: 5, user_id: user1.id)
comment8 = Comment.create!(body: 'Tá na média.', restaurant_id: restaurant3.id, status: 0, user_id: user2.id)
comment9 = Comment.create!(body: 'Péssimo!', restaurant_id: restaurant3.id, status: 5, user_id: user3.id)

rating1 = Rating.create!(star: 5, restaurant_id: restaurant1.id, user_id: user1.id)
rating2 = Rating.create!(star: 3, restaurant_id: restaurant1.id, user_id: user2.id)
rating3 = Rating.create!(star: 1, restaurant_id: restaurant1.id, user_id: user3.id)
rating4 = Rating.create!(star: 4, restaurant_id: restaurant2.id, user_id: user1.id)
rating5 = Rating.create!(star: 3, restaurant_id: restaurant2.id, user_id: user2.id)
rating6 = Rating.create!(star: 2, restaurant_id: restaurant2.id, user_id: user3.id)
rating7 = Rating.create!(star: 5, restaurant_id: restaurant3.id, user_id: user1.id)
rating8 = Rating.create!(star: 3, restaurant_id: restaurant3.id, user_id: user2.id)
rating9 = Rating.create!(star: 1, restaurant_id: restaurant3.id, user_id: user3.id)


