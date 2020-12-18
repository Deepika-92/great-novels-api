const models = require('../models')

const getAllAuthors = async (request, response) => {
  const authors = await models.authors.findAll()

  return authors
    ? response.send(authors)
    : response.sendStatus(404)
}


const getAuthorById = async (request, response) => {
  const { id } = request.params

  const foundAuthor = await models.authors.findAll({
    where: {
      [models.Op.or]: [
        { id: { [models.Op.like]: id } },
        { nameLast: { [models.Op.like]: `%${id}%` } },
      ]
    },
    include: [{
      model: models.novels,
      include: [{ model: models.genres }]
    }]
  })

  return foundAuthor
    ? response.send(foundAuthor)
    : response.sendStatus(404)
}

module.exports = {
  getAllAuthors,
  getAuthorById,

}
