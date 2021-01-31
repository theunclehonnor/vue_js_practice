<template>
  <div class="main mt-3">
   <b-row class="status m-0 pl-5 pr-5">
<!--     Статусы-->
     <b-card no-body class="w-100">
       <b-tabs card>
         <b-tab :title="status[0].label" active>
           <table class="table table-hover">
             <thead>
             <tr>
               <th scope="col">Фото</th>
               <th scope="col">Профессия</th>
               <th scope="col">ФИО</th>
               <th scope="col">Возраст</th>
             </tr>
             </thead>
             <tbody>
             <tr v-for="(item,index) in items" :key="index" class="table-hover_pointer" @click="editProfile(item.fullName)">
               <td>
                 <img :src="item.photo" class="table__img" :alt="item.fullName">
               </td>
               <td>{{item.profession}}</td>
               <td>{{item.fullName}}</td>
               <td>{{item.age}}</td>
             </tr>
             </tbody>
           </table>
         </b-tab>
         <b-tab :title="status[1].label">
           <b-card-text>Tab contents 2</b-card-text>
         </b-tab>
         <b-tab :title="status[2].label">
           <b-card-text>Tab contents 2</b-card-text>
         </b-tab>
         <b-tab :title="status[3].label">
           <b-card-text>Tab contents 2</b-card-text>
         </b-tab>
       </b-tabs>
     </b-card>
   </b-row>
    <!--  Список кандидатов по статусам    -->
  </div>
</template>

<script>
export default {
  name: "Main",
  data() {
    return {
      status: [
        {label:'Новый', alert: 'primary' },
        {label:'Назначено собеседование', alert: 'warning' },
        {label:'Принят', alert: 'success' },
        {label:'Отказ', alert: 'danger' },
      ],
      items:[
        {
          photo: 'https://bez-makiyazha.ru/wp-content/uploads/2020/07/KERRI_Dzhim15.jpg',
          profession: 'Программист',
          fullName: 'Акулов Игорь Александрович',
          age: 45
        },
        {
          photo: 'https://bez-makiyazha.ru/wp-content/uploads/2020/07/KERRI_Dzhim15.jpg',
          profession: 'Программист',
          fullName: 'Акулов Игорь Александрович',
          age: 45
        },
      ],
    }
  },
  methods: {
    editProfile(id) {
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
.status-text {
  font-size: 18px;
}
</style>