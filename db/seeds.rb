# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.create(
  [{
    name: 'Lord of the Rings: The Fellowship of the Ring',
    genre: 'Aventura, Fantasia epica',
    price: 8000,
    time: '178 minutos',
  },
  {
    name: 'The Hobbit: An Unexpected Journey',
    genre: 'Aventura, Fantasia heroica, Accion, Drama',
    price: 7000,
    time: '169 minutos',
  },
  {
    name: 'La princesa Mononoke',
    genre: 'Fantasia, Aventura, Drama',
    price: 10000,
    time: '134 minutos',
  }]
)
TvSerie.create(
  [{
    name: 'Arrow',
    genre: 'Accion, Aventura, Basada en comics',
    price: 5000,
    season: '8 temporadas',
  },
  {
    name: 'Gotham',
    genre: 'Drama, Basada en comics',
    price: 5000,
    season: '5 temporadas',
  },
  {
    name: 'Brooklyn Nine-Nine',
    genre: 'Sitcoms, Comedia',
    price: 4500,
    season: '6 temporadas',
  }]
)