import Vue from "vue";
import Admin from '../components/admin'

const element = document.getElementById('admin-app')
const props = JSON.parse(element.getAttribute('data'))

if (element && props) {
  window.Admin = new Vue({
    el: '#admin-app',
    render: h => h(Admin, { props })
  });
}
