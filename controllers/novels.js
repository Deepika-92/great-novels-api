const models = require('../models')

const getAllNovels = async (request, response) => {
  const novels = await models.novels.findAll({
    include: [{ model: models.authors },
      { model: models.genres }]
  })

  return response.send(novels)
}

const getNovelById = async (request, response) => {
  const { id } = request.params

  const novel = await models.novels.findOne({
    where: { id },
    include: [{ model: models.authors }, { model: models.genres }]
  })

  return novel
    ? response.send(novel)
    : response.sendStatus(404)
}

module.exports = {

  getAllNovels,
  getNovelById
}
