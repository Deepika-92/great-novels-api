const Sequelize = require('sequelize')
const allConfigs = require('../config/sequelize')
const authorsModel = require('./authors')
const genresModel = require('./genres')
const novelsModel = require('./novels')
const novelsGenresModel = require('./novelsGenres')

const environment = process.env.NODE_ENV || 'development'
const config = allConfigs[environment]


const connection = new Sequelize(config.database, config.username, config.password, {
  host: config.host, dialect: config.dialect
})

/* const connection = new Sequelize('greatnovels', 'novels', 'novel$s', {
  host: 'localhost', dialect: 'mysql'
})*/

const authors = authorsModel(connection, Sequelize)
const novels = novelsModel(connection, Sequelize, authors)
const genres = genresModel(connection, Sequelize)
const novelsGenres = novelsGenresModel(connection, Sequelize, genres, novels)

authors.hasMany(novels)
novels.belongsTo(authors)

novels.belongsToMany(genres, { through: novelsGenres })
genres.belongsToMany(novels, { through: novelsGenres })

module.exports = {
  authors, novels, genres, Op: Sequelize.Op, novelsGenres
}
