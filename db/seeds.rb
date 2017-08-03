# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Publication.delete_all
User.delete_all
user = User.new
user.email = 'aacosta8@eafit.edu.co'
user.password = '123456'
user.password_confirmation = '123456'
user.save!


Publication.create!( id: 1, name: "Foto1", description:"foto de prueba 1", place: "Medelín", permission_pub: 0, user_id:1, photo: File.new("/home/alex/Imágenes/Wallpapers/beautiful_abstract-HD.jpg") )
Publication.create!( id: 2, name: "Foto2", description:"foto de prueba 2", place: "Medelín", permission_pub: 1, user_id:1, photo: File.new("/home/alex/Imágenes/Wallpapers/beautiful_abstract-HD.jpg"))
Publication.create!( id: 3, name: "Foto3", description:"foto de prueba 3", place: "Medelín", permission_pub: 2, user_id:1, photo: File.new("/home/alex/Imágenes/Wallpapers/beautiful_abstract-HD.jpg"))
