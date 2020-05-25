<template>
  <div id="home-app">
    <nav-bar></nav-bar>
    <div id='home-rate' class="row main-content">
      <h1 class="col-12 text-center align-self-center">
        USD
        <span class="grey-text">{{ moment(created_at).format('DD.MM') }}</span>
        <span>{{ rate }}</span>
        <sup v-if="forced" class="grey-text">Forced</sup>
      </h1>
    </div>
  </div>
</template>

<script>

  import Vue from 'vue';
  import moment from 'moment';
  import NavBar from "./navBar";

  Vue.prototype.moment = moment

  export default {
    components: {NavBar},
    props: {
      rate: String,
      created_at: String,
      forced: Boolean
    }
  }
</script>
