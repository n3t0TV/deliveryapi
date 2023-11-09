/* global module */
const response = require('../network/response')
const webPush = require('web-push')
const colors = require('colors')
const uidsafe = require('uid-safe')

const publicVapidKey = 'BL3WHgb0wgJmfR8v71-BiQ8UmeAXoNinkguQD7HRFBkD9D5W0mc5Cmjyv2rZoeF6LdPalGLYaezF-4Qb82fjYPg'
const privateVapidKey = '1crb0wI6b2tMM1BYNjJEQHMvtKx1qmefy8RkpkznIcw'
webPush.setVapidDetails('mailto:devops@tortoise.dev', publicVapidKey, privateVapidKey)
const userSubscription = {}

/**
 *
 * @param {Request} req
 * @param {Response} res
 */
const middleware = (req, res) => {
  const subscription = req.body
  if (req.session.user) {
    userSubscription[req.session.user.id] = subscription
  }
  response.success(req, res, {}, 'ok', 201)
}

module.exports = {
  middleware,
  notifyAll,
  notifyUser,
  userSubscription,
  unsubscribe
}

function unsubscribe (userId) {
  delete userSubscription[userId]
}

/**
 * Notify all users
 * @param {String} title
 * @param {String} body
 */
function notifyAll (title, body = '') { // Notificar a todos los usuarios;
  console.log('Global notification:'.yellow, title)
  for (const uid in userSubscription) {
    notifyUser(uid, title, body)
  }
}
/**
 * Send notification to user
 * @param {String} userId
 * @param {String} title
 * @param {String} body
 */
function notifyUser (userId, title, body = '') {
  const subscription = userSubscription[userId]
  if (!subscription) return false
  const payload = JSON.stringify({
    title: title,
    body: body
  })
  webPush.sendNotification(subscription, payload).catch((e) => { console.log('Webpush error'.red, e, subscription) })
  return true
}
