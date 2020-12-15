const models = require('../models')

const getAllAuthors = async (request, response) => {
  const authors = await models.authors.findAll()

  return response.send(authors)
}

const getAuthorById = async (request, response) => {
  const { id } = request.params

  const author = await models.authors.findOne({
    where: { id },
    include: [{ model: models.novels, include: [{ model: models.genres }] }


    ]
  })

  return author
    ? response.send(author)
    : response.sendStatus(404)
}

module.exports = {
  getAllAuthors,
  getAuthorById,

}
