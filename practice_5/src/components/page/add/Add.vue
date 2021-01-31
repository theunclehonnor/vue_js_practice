<template>
  <div class="form">
    <div class="d-flex">
      <b-col class="form_col form-input">
        <div>
          <b-form @submit="onSubmit" @reset="onReset" v-if="show">
            <!--Профессия-->
            <b-form-group
                id="input-group-prof"
                :label="form.profession.label+':'"
                label-for="input-prof"
            >
              <b-form-input
                  id="input-prof"
                  v-model="form.profession.values"
                  type="text"
                  placeholder="Стажер"
                  required
              ></b-form-input>
            </b-form-group>
            <!--Город-->
            <b-form-group
                id="input-group-city"
                :label="form.city.label+':'"
                label-for="input-city"
            >
              <b-form-input
                  id="input-city"
                  v-model="city"
                  type="text"
                  placeholder="Липецк"
                  required
              ></b-form-input>
              <b-list-group v-if="cities">
                <b-list-group-item v-for="(city,index) in cities" :key="index" button @click="clickCity(index)">
                  {{ city.title }}
                </b-list-group-item>
              </b-list-group>
            </b-form-group>
            <!--Фото-->
            <b-form-group
                id="input-group-photo"
                :label="form.photo.label+':'"
                label-for="input-photo"
            >
              <b-form-input
                  id="input-photo"
                  v-model="form.photo.values"
                  type="text"
                  placeholder="https://yandex.ru/images/search?pos=0&img_url=https%3A%2F%2Fpbs.twimg.com%2Fmedia%2FCQtJ7J5VAAAt0hA.jpg"
                  required
              ></b-form-input>
            </b-form-group>
            <!--Телефон-->
            <b-form-group
                id="input-group-tel"
                :label="form.tel.label+':'"
                label-for="input-tel"
            >
              <b-form-input
                  id="input-tel"
                  v-model="form.tel.values"
                  type="tel"
                  placeholder="9991234561"
                  required
              ></b-form-input>
            </b-form-group>
            <!--ФИО-->
            <b-form-group id="input-group-fullName" :label="form.fullName.label+':'" label-for="input-fullName">
              <b-form-input
                  id="input-fullName"
                  v-model="form.fullName.values"
                  placeholder="Иванов Иван Иванович"
                  required
              ></b-form-input>
            </b-form-group>
            <!--Почта-->
            <b-form-group
                id="input-group-email"
                :label="form.email.label+':'"
                label-for="input-email"
                description="Мы никогда не будем делиться вашей электронной почтой ни с кем другим, наверное.."
            >
              <b-form-input
                  id="input-email"
                  v-model="form.email.values"
                  type="email"
                  placeholder="Enter email"
                  required
              ></b-form-input>
            </b-form-group>
            <!--Дата рождения-->
            <b-form-group id="input-group-dateBirthday" :label="form.dateBirthday.label+':'" label-for="input-dateBirthday">
              <b-form-datepicker id="input-group-dateBirthday" v-model="form.dateBirthday.values" placeholder="Не выбрана" class="mb-2"></b-form-datepicker>
            </b-form-group>
            <!--Образование-->
            <Education
                v-for="(education,index) in form.education"
                :education="education"
                :education_length="form.education.length"
                :degrees="degrees"
                :index="index"
                :city="form.city.values"
                @add-education="addEducation"
                @remove-education="removeEducation"
                :key="index">
            </Education>
            <!--Зарплата-->
            <b-form-group
                id="input-group-salary"
                :label="form.salary.label+':'"
                label-for="input-salary"
                description="В рублях"
            >
              <b-form-input
                  id="input-salary"
                  v-model="form.salary.values"
                  placeholder="100000"
                  required
              ></b-form-input>
            </b-form-group>
            <!--Навыки-->
            <b-form-group
                id="input-group-skills"
                :label="form.skills.label+':'"
                label-for="input-salary"
                description="Вводите навыки через запятую"
            >
              <b-form-textarea
                  id="input-skills"
                  v-model="form.skills.values"
                  placeholder="Vue, python, js..."
                  rows="3"
                  max-rows="6"
              ></b-form-textarea>
            </b-form-group>
            <!--О себе-->
            <b-form-group
                id="input-group-aboutMe"
                :label="form.aboutMe.label+':'"
                label-for="input-aboutMe"
            >
              <b-form-textarea
                  id="input-aboutMe"
                  v-model="form.aboutMe.values"
                  placeholder="Кодю на vue..."
                  rows="3"
                  max-rows="6"
              ></b-form-textarea>
            </b-form-group>

            <b-alert v-if="errors.length" show variant="danger">
              <b>Пожалуйста исправьте указанные ошибки:</b>
              <ul>
                <li v-for="(error, ind) in errors" :key="ind">{{ error }}</li>
              </ul>
            </b-alert>

            <!--Селект статуса-->
            <select-status :form_status="form.status" :status="status" @input-status="form.status.values"></select-status>

            <div class="d-flex justify-content-around">
              <b-button type="submit" variant="primary">Применить</b-button>
              <b-button type="reset" variant="danger">Сбросить</b-button>
            </div>
          </b-form>
        </div>
      </b-col>
      <b-col class="form_col form-output">
        <h2 class="text-center">Резюме</h2>
        <div class="">
          <div class="d-flex justify-content-center">
            <img v-if="showResume" :src="form.photo.values" alt="" class="img_size">
          </div>
          <p class="mb-2" v-for="(f,index) in form" :key="index">
            <template v-if="f.label !== form.photo.label">
              <template v-if="f !== form['education']">
                {{f.label}}:
              </template>
              <template v-if="showResume & f !== form['education']">
                {{f.values}}
              </template>
            </template>
          </p>
          <b-alert show variant="secondary" v-for="(education,index) in form.education" :key="index">
            <template v-if="education.degree.values === degrees[0]">
              <p>{{education.degree.label}}: {{education.degree.values}}</p>
            </template>
            <template v-else-if="education.degree.values === null">
              <p>{{education.degree.label}}:Отсутствует</p>
            </template>
            <template v-else>
              <p v-for="(ed,ind) in education" :key="ind">
                {{ed.label}}:
                <template v-if="showResume">
                  {{ed.values}}
                </template>
              </p>
            </template>
          </b-alert>
        </div>
      </b-col>
    </div>
  </div>
</template>

<script>
import SelectStatus from '@/components/page/add/form/SelectStatus'
import Education from "@/components/page/add/form/Education";
import jsonp from 'jsonp';
export default {
  name: "Add",
  components:{
    SelectStatus,
    Education
  },
  data() {
    return {
      cities: [],
      city: '',
      errors: [],
      form: {
        fullName: {label:'ФИО', values: ''},
        photo: {label:'Ссылка на фото', values: 'https://bez-makiyazha.ru/wp-content/uploads/2020/07/KERRI_Dzhim15.jpg'},
        profession: {label:'Профессия', values: ''},
        city: {label:'Город', values: ''},
        tel: {label:'Номер телефона', values: ''},
        email: {label:'Почта', values: ''},
        dateBirthday: {label:'Дата рождения', values: ''},
        education: [
          {
            degree: {label:'Уровень образования', values: null},
            educationUniversity: {label:'Учебное заведение', values: ''},
            faculty: {label:'Факультет', values: ''},
            specialization: {label:'Специализация', values: ''},
            yearEnd: {label:'Год окончания', values: ''},
          }
        ],
        salary: {label:'Ожидаемая заработная плата', values: ''},
        skills: {label:'Навыки', values: ''},
        aboutMe: {label:'О себе', values: ''},
        status: {label:'Статус', values:'Новый'},
      },
      degrees: ['Среднее', 'Среднее специальное', 'Неоконченное высшее', 'Высшее'],
      status: ['Новый', 'Назначено собеседование', 'Принят', 'Отказ'],
      show: true,
      showResume: false
    }
  },
  watch: {
    // эта функция запускается при любом изменении вопроса
    city:  function () {
      this.cities = 'Ожидаю, когда вы закончите печатать...';
      this.debouncedGetAnswer();
    }
  },
  created: function () {
    this.debouncedGetAnswer = this.lodash.debounce(this.getCity, 500);
  },
  methods: {
    getCity: function () {
      this.cities  = 'Думаю...';
      let vm = this;
      jsonp('https://api.vk.com/method/database.getCities?country_id=1&need_all=1&count=10&v=5.126&access_token=' + process.env.VUE_APP_ACCESS_TOKEN_VK + '&lang=ru&q=' + vm.city +'', null, (err, data) => {
        if (err) {
          vm.cities = err.message;
        } else {
          vm.cities = data.response.items;
        }
      });
    },
    clickCity(index){
      this.city = this.cities[index].title;
      this.form.city.values = this.city;
      this.cities = [];
    },
    addEducation() {
      this.form.education.push(
          {
            degree: {label: 'Уровень образования', values: null},
            educationUniversity: {label: 'Учебное заведение', values: ''},
            faculty: {label: 'Факультет', values: ''},
            specialization: {label: 'Специализация', values: ''},
            yearEnd: {label: 'Год окончания', values: ''},
          }
      );
    },
    removeEducation(index) {
      this.form.education.splice(index,1);
    },
    onSubmit(event) {
      this.errors =[];
      let regTel = new RegExp('\\d{'+this.form.tel.values.length +'}', 'gim');
      let regSalary = new RegExp('\\d{'+this.form.salary.values.length +'}', 'gim');

      if(this.form.tel.values.length < 6 || this.form.tel.values.length >10 || !regTel.test(this.form.tel.values)) {
        this.errors.push('Не корректно заполнен номер телефона, он должен состоять от 6 до 10 символов, и содержать только цифры');
      }

      if(this.form.dateBirthday.values === '')
        this.errors.push('Укажите дату рождения');

      for(let i = 0; i < this.form.education.length; i++){
        if(this.form.education[i].degree.values !== this.degrees[0] || this.form.education[i].degree.values !== null){
          let regYearEnd = new RegExp('\\d{'+this.form.education[i].yearEnd.values.length +'}', 'gim');
          if(!regYearEnd.test(this.form.education[i].yearEnd.values))
            this.errors.push('Не корректно заполнен год окончания');
        }
      }

      if(!this.clickCityCheck)
        this.form.city.values = this.city;

      if(!regSalary.test(this.form.salary.values))
        this.errors.push('Не корректно заполнена ожидаемая ЗП, вводите только цифры');

      if(this.form.skills.values === '')
        this.errors.push('Укажите ваши навыки, хотя бы один');

      if(this.form.aboutMe.values === '')
        this.errors.push('Укажите хотя бы пару слов о себе');

      if(!this.errors.length)
        this.showResume = true;
      else
        this.showResume = false;

      event.preventDefault();
    },
    onReset(event) {
      event.preventDefault();
      // Reset our form values
      this.cities = [];
      this.city = '';
      this.form.fullName.values = '';
      this.form.photo.values = '';
      this.form.profession.values = '';
      this.form.city.values = '';
      this.form.tel.values = '';
      this.form.email.values = '';
      this.form.dateBirthday.values = '';
      this.form.education = [
        {
          degree: {label:'Уровень образования', values: null},
          educationUniversity: {label:'Учебное заведение', values: ''},
          faculty: {label:'Факультет', values: ''},
          specialization: {label:'Специализация', values: ''},
          yearEnd: {label:'Год окончания', values: ''},
        }
      ];
      this.form.salary.values = '';
      this.form.skills.values = '';
      this.form.aboutMe.values = '';
      this.form.status.values = this.status[0];
      this.showResume = false;
      // Trick to reset/clear native browser form validation state
      this.show = false;
      this.$nextTick(() => {
        this.show = true;
      })
    },
  }
}
</script>

<style scoped>
.form_col {
  padding: 20px 80px 20px 80px;
}
.img_size {
  max-width: 250px;
  max-height: 250px;
}
</style>