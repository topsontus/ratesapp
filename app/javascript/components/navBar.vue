<template>
  <div class="row justify-content-between navbar-panel">
    <h1 class="col-auto mb-0 align-self-center"><a class="text-decoration-none" href="/">Rate</a></h1>
    <transition name="bounce">
      <div v-show="flash" class=" col-auto mb-0 alert alert-info align-self-center">{{message}}</div>
    </transition>
    <div v-if='current_user' class="col-auto align-self-center btn-group">
      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Admin
      </button>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="/admin">Admin panel</a>
        <a class="dropdown-item"
           data-method="delete"
           :href="destroySessionUrl">
          Log out
        </a>
      </div>
    </div>
    <div v-else class="col-auto align-self-center">
      <a class="btn btn-primary" :href="newSessionUrl">Sign in</a>
    </div>
  </div>
</template>

<script>
  const element = document.getElementById('navBar-app')
  const data = JSON.parse(element.getAttribute('data'))

  export default {
    data: function () {
      return {
        destroySessionUrl: data.logOutUrl,
        newSessionUrl: data.signInUrl,
        current_user: data.current_user,
      }
    },

    props: {
      flash: { type: Boolean, default: false },
      message: { type: String }
    }
  }
</script>
