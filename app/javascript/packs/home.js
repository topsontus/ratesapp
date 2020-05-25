import Vue from "vue";
import Home from '../components/home'

const element = document.getElementById('home-app')
const props = JSON.parse(element.getAttribute('data'))

if (element && props) {
  window.Home = new Vue({
    el: '#home-app',
    render: h => h(Home, { props })
  });
}
