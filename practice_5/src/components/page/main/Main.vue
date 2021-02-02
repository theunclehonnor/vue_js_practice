<template>
  <div class="main mt-3">
   <b-row class="status m-0 pl-5 pr-5">
<!--     Статусы-->
     <b-card no-body class="w-100">
       <b-tabs card>
         <b-tab :title="resume[0].status" active>
           <Table :resume="resume[0].values"></Table>
         </b-tab>
         <b-tab :title="resume[1].status">
           <Table :resume="resume[1].values"></Table>
         </b-tab>
         <b-tab :title="resume[2].status">
           <Table :resume="resume[2].values"></Table>
         </b-tab>
         <b-tab :title="resume[3].status">
           <Table :resume="resume[3].values"></Table>
         </b-tab>
       </b-tabs>
     </b-card>
   </b-row>
    <!--  Список кандидатов по статусам    -->
  </div>
</template>

<script>
import Table from '@/components/page/main/Table'
export default {
  name: "Main",
  components: {
    Table
  },
  data() {
    return {
      status: [
        {label:'Новый', alert: 'primary' },
        {label:'Назначено собеседование', alert: 'warning' },
        {label:'Принят', alert: 'success' },
        {label:'Отказ', alert: 'danger' },
      ],
      temp: [],
      resume: [
        {status: 'Новый', values: []},
        {status: 'Назначено собеседование', values: []},
        {status: 'Принят', values: []},
        {status: 'Отказ', values: []},
      ],
    }
  },
  mounted() {
    // Получение всех резюме при загрузке страницы
    // новые резюме
    this.axios.get('http://api').then(response => (
        this.resume[0].values = this.filterCandidate_new(response.data)
    ));
    // назначено собеседование
    this.axios.get('http://api').then(response => (
        this.resume[1].values = this.filterCandidate_process(response.data)
    ));
    // принятые
    this.axios.get('http://api').then(response => (
        this.resume[2].values = this.filterCandidate_success(response.data)
    ));
    // отказано
    this.axios.get('http://api').then(response => (
        this.resume[3].values = this.filterCandidate_renouncement(response.data)
    ));
  },
  methods: {
    // фильтрация по статусам кандидатов
    filterCandidate_new(candidates) {
      function filtration(value) {
        let result = false;
        if (value.status === 'Новый') {
          result = true;
        }
        return result;
      }
      return  candidates.filter(filtration);
    },
    filterCandidate_process(candidates) {
      function filtration(value) {
        let result = false;
        if (value.status === 'Назначено собеседование') {
          result = true;
        }
        return result;
      }
      return  candidates.filter(filtration);
    },
    filterCandidate_success(candidates) {
      function filtration(value) {
        let result = false;
        if (value.status === 'Принят') {
          result = true;
        }
        return result;
      }
      return  candidates.filter(filtration);
    },
    filterCandidate_renouncement(candidates) {
      function filtration(value) {
        let result = false;
        if (value.status === 'Отказ') {
          result = true;
        }
        return result;
      }
      return  candidates.filter(filtration);
    },
  }
}
</script>

<style scoped>

</style>