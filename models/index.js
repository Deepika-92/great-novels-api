const Sequelize = require('sequelize')
const authorsModel = require('./authors')
const genresModel = require('./genres')
const novelsModel = require('./novels')
const novelsGenresModel = require('./novelsGenres')

const connection = new Sequelize('greatnovels', 'novels', 'novel$s', {
  host: 'localhost', dialect: 'mysql'
})

const authors = authorsModel(connection, Sequelize)
const novels = novelsModel(connection, Sequelize, authors)
const genres = genresModel(connection, Sequelize)
const novelsGenres = novelsGenresModel(connection, Sequelize, genres, novels)

authors.hasMany(novels)
novels.belongsTo(authors)

novels.belongsToMany(genres, { through: novelsGenres })
genres.belongsToMany(novels, { through: novelsGenres })

module.exports = { authors, novels, genres, Sequelize, novelsGenres }
