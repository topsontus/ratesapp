import consumer from "./consumer"

consumer.subscriptions.create("RateChannel", {
  received(message) {
    var moment = require('moment');
    const divHomeRate = document.getElementById('home-rate')
    const divAdminRate = document.getElementById('admin-rate')

    let updated_at = message['updated_at']
    let forced_rate_expiration = message['forced_rate_expiration']

    let homeData = updated_at ? moment(updated_at).format('DD.MM') : null
    let adminData = forced_rate_expiration ? moment(forced_rate_expiration).format('YYYY-MM-DD HH:mm:ss') : null

    if (divHomeRate) {
      if (homeData) {
        divHomeRate.getElementsByTagName('span')[0].innerText = homeData
      }
      divHomeRate.getElementsByTagName('span')[1].innerText = message['forced_rate'] || message['rate']
    } else if (divAdminRate) {
      if (adminData) {
        divAdminRate.getElementsByClassName('mx-input')[0].setAttribute('placeholder', adminData)
      }
      if (message['forced_rate']) {
        divAdminRate.getElementsByClassName('rate-input')[0].setAttribute('placeholder', message['forced_rate'])
      }
    }
  }
});
