const models = require('../models')
const getAllGenres = async (request, response) => {
  const genres = await models.genres.findAll()

  return genres
    ? response.send(genres)
    : response.sendStatus(404)
}
const getGenreById = async (request, response) => {
  const { id } = request.params

  const foundGenre = await models.genres.findOne({
    where: { id },
    include: [{
      model: models.novels,
      include: [{ model: models.authors }]
    }]
  })

  return foundGenre
    ? response.send(foundGenre)
    : response.sendStatus(404)
}

module.exports = {

  getAllGenres,
  getGenreById,

}
