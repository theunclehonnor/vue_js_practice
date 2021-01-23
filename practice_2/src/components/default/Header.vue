<template>
  <b-navbar type="dark" class="nav_color">
    <b-container>
      <b-navbar-nav class="d-flex align-items-center">
        <b-nav-item class="d-flex justify-content-center align-items-center logo">
          <span class="nav__font logo__font">gg</span>
        </b-nav-item>
        <b-nav-item v-for="(nq,index) in nameQuestions" class="nav__font" href="#" :key="index" @click="pages(index)">
          <span class="nav__font">{{nq}}</span>
        </b-nav-item>
      </b-navbar-nav>
    </b-container>
  </b-navbar>
</template>

<script>
export default {
  name: "Header",
  data() {
    return {
      nameQuestions: ['Конвертер','Форма'],
    }
  },
  methods: {
    pages(index) {
      this.$emit('get-pages', index);
    }
  }
}
</script>

<style>
/* Header */
/* Navbar */
.nav_color{
  background: #222222;
  height: 80px;
}
.nav__font {
  font-weight: 400;
  font-size: 16px;
  color: white;
}
.nav__font:hover {
  color: #90CCF8;
}
.logo {
  width: 50px;
  height: 50px;
  background: #D6001C;
  border-radius: 50%;
}
.logo a{
  margin-bottom: 5px;
}
.logo__font {
  font-size: 25px;
}
</style>