<template>
  <div id="app" class="bg_prop">
<!--    Navbar-->
    <Header @get-pages="pages"></Header>
<!--    Main-->
    <Converter :style="stylePage[0].style"/>
    <Form :style="stylePage[1].style"/>
  </div>
</template>

<script>
import Header from "@/components/default/Header";
import Converter from "@/components/Converter";
import Form from "@/components/Form";
export default {
  name: 'App',
  components: {
    Header, Converter, Form
  },
  data(){
    return {
      stylePage: [
        {
          name: 'Converter',
          style: 'display: inline'
        },
        {
          name: 'Form',
          style: 'display: none'
        }
      ]
    }
  },
  methods: {
    // Метод, определяющий какую форму показывать
    pages(index) {
      switch(index) {
        case 0:
          this.stylePage[0].style = 'display: inline';
          this.stylePage[1].style = 'display: none';
          break;
        case 1:
          this.stylePage[0].style = 'display: none';
          this.stylePage[1].style = 'display: inline';
          break;
      }
    }
  }
}
</script>

<style>
/* Main */
body {
  font-family: Arial, sans-serif;
  font-size: 14px;
}
p {
  margin: 0;
}
.bg_prop {
  background: #F9F9F9;
  min-height: 100vh;
}
</style>
