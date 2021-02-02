<template>
  <table class="table table-hover">
    <thead>
    <tr>
      <th scope="col">Фото</th>
      <th scope="col">Профессия</th>
      <th scope="col">ФИО</th>
      <th scope="col">Возраст</th>
      <th scope="col">Взаимодействие</th>
    </tr>
    </thead>
    <tbody>
    <tr v-for="(item,index) in resume" :key="index" class="table-hover_pointer">
      <td>
        <img :src="item.photo" class="table__img" :alt="item.full_name">
      </td>
      <td class="font-text">{{item.profession}}</td>
      <td class="font-text">{{item.full_name}}</td>
      <td class="font-text">{{item.age}}</td>
      <td>
        <b-button variant="outline-primary" @click="editResume(item.id_candidate)">Подробнее</b-button>
      </td>
    </tr>
    </tbody>
  </table>
</template>

<script>
export default {
  name: "Table",
  props: ['resume'],
  methods: {
    // при клике на определённое резюме открываем страницу с редактированием данных
    editResume(id) {
      this.$router.push({name: 'edit', params: {id}})
    }
  }
}
</script>

<style scoped>
.table__img {
  max-width: 150px;
  max-height: 150px;
}
.table-hover_pointer:hover {
  cursor: pointer;
}
.font-text {
  font-size: 20px;
}
</style>