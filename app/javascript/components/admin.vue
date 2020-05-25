<template>
  <div id="admin-app">
    <nav-bar :flash="flash" :message="message"></nav-bar>
    <div class="row main-content">
      <div id="admin-rate" class="row justify-content-center offset-4 col-4 text-center align-self-center">
        <div class="row mb-2">
          <date-picker class="col-12"
                       type="datetime"
                       v-model="input_force_rate_expiration"
                       :placeholder="moment(forced_rate_expiration).format('YYYY-MM-DD HH:mm:ss')">
          </date-picker>
        </div>
        <div class="row justify-content-center">
          <input name="Rate"
                 class="form-control col-4 mr-2 rate-input"
                 style="text-align: right"
                 v-model="input_forced_rate"
                 type="text"
                 :placeholder="forced_rate">
          <button class="btn btn-primary" @click="onSubmit">Create</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

  import axios from 'axios';
  import Vue from 'vue';
  import DatePicker from 'vue2-datepicker';
  import 'vue2-datepicker/index.css';
  import NavBar from "./navBar";
  import moment from 'moment';

  Vue.prototype.moment = moment

  export default {
    components: { DatePicker, NavBar },
    data() {
      return {
        flash: false,
        message: '',
        input_forced_rate: '',
        input_force_rate_expiration: ''
      }
    },

    props: {
      ratePostUrl: String,
      forced_rate_expiration: String,
      forced_rate: String
    },

    methods: {
      onSubmit() {
        axios.post(this.ratePostUrl, {
            rate: {
              forced_rate_expiration: this.input_force_rate_expiration,
              forced_rate: this.input_forced_rate
            }
          })
            .then(this.show('Has been updated'))
            .catch(e => {
              this.show(e.response['data'].join(', '))
            });
      },

      show(message) {
        this.flash = true
        this.message = message

        setTimeout(this.hide, 5000)
      },

      hide() {
        this.flash = false
      }
    }
  }
</script>

