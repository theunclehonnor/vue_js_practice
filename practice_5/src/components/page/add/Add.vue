<template>
  <div class="form">
    <div class="d-flex justify-content-center">
<!--      Блок работы с данными по резюме -->

      <b-col v-if="redacted" class="form_col form-input">
        <div>
<!--          При успехе появится сообщение-->
          <template v-if="showResume">
            <b-alert show>
              <p v-for="(text,ind) in alert_text" :key="ind">{{text}}</p>
            </b-alert>
          </template>
<!--          Форма с данными-->
         <template v-if="!showResume">
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
             <b-form-group id="input-group-fullName" :label="form.full_name.label+':'" label-for="input-fullName">
               <b-form-input
                   id="input-fullName"
                   v-model="form.full_name.values"
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
             <b-form-group id="input-group-dateBirthday" :label="form.birthday.label+':'" label-for="input-dateBirthday">
               <b-form-datepicker id="input-group-dateBirthday" v-model="form.birthday.values" placeholder="Не выбрана" class="mb-2"></b-form-datepicker>
             </b-form-group>
             <!--Образование-->
             <template v-if="this.form.education.length">
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
             </template>
             <template v-else>
               <b-button variant="outline-primary" @click="addEducation">Добавить образование</b-button>
             </template>
             <!--Зарплата-->
             <b-form-group
                 id="input-group-salary"
                 :label="form.wage.label+':'"
                 label-for="input-salary"
                 description="В рублях"
             >
               <b-form-input
                   id="input-salary"
                   v-model="form.wage.values"
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
                 :label="form.about.label+':'"
                 label-for="input-aboutMe"
             >
               <b-form-textarea
                   id="input-aboutMe"
                   v-model="form.about.values"
                   placeholder="Кодю на vue..."
                   rows="3"
                   max-rows="6"
               ></b-form-textarea>
             </b-form-group>
             <!--Селект статуса-->
               <b-form-group id="input-group-status" :label="form.status.label+':'" label-for="input-status">
                 <b-form-select
                     id="input-status"
                     v-model="form.status.values"
                     :options="status"
                     required
                 ></b-form-select>
               </b-form-group>
             <!--Error оповещение-->
             <b-alert v-if="errors.length" show variant="danger">
               <b>Пожалуйста исправьте указанные ошибки:</b>
               <ul>
                 <li v-for="(error, ind) in errors" :key="ind">{{ error }}</li>
               </ul>
             </b-alert>

             <div class="d-flex justify-content-around">
               <b-button type="submit" variant="primary">Применить</b-button>
               <b-button type="reset" variant="danger">Сбросить</b-button>
             </div>
           </b-form>
         </template>
        </div>
      </b-col>

<!--      Блок с выводом резюме -->
      <b-col cols="6" class="form_col form-output">
        <!--      Кнопка, которая открывает форму редактирование при нажатии-->
        <b-button v-if="!redacted" variant="outline-primary" @click="formActive">Редактировать</b-button>
<!--   Блок с выводом резюме     -->
        <h2 v-if="$route.name === 'edit'" class="text-center">Резюме</h2>
        <h2 v-else-if="$route.name === 'add'"  class="text-center">Шаблон резюме</h2>
        <Resume :showResume="showResume" :form="form" :degrees="degrees" :redacted="redacted"></Resume>

      </b-col>
    </div>
  </div>
</template>

<script>
import Education from "@/components/page/add/form/Education";
import Resume from '@/components/page/add/Resume';
import jsonp from 'jsonp';
export default {
  name: "Add",
  components:{
    Education,
    Resume
  },
  data() {
    return {
      redacted: false,
      alert_text: [],
      cities: [],
      city: '',
      errors: [],
      form: {
        full_name: {label:'ФИО', values: ''},
        photo: {label:'Ссылка на фото', values: 'https://bez-makiyazha.ru/wp-content/uploads/2020/07/KERRI_Dzhim15.jpg'},
        profession: {label:'Профессия', values: ''},
        city: {label:'Город', values: ''},
        tel: {label:'Номер телефона', values: ''},
        email: {label:'Почта', values: ''},
        birthday: {label:'Дата рождения', values: ''},
        education: [],
        wage: {label:'Ожидаемая заработная плата', values: ''},
        skills: {label:'Навыки', values: ''},
        about: {label:'О себе', values: ''},
        status: {label:'Статус', values:'Новый'},
      },
      degrees: ['Среднее', 'Среднее специальное', 'Неоконченное высшее', 'Высшее'],
      status: ['Новый', 'Назначено собеседование', 'Принят', 'Отказ'],
      show: true,
      showResume: false
    }
  },
  mounted() {
    if(this.$route.name === 'edit'){
      // запрос к апи на вывод данных по кандидату
      this.axios.get('http://api/'+ this.$route.params.id +'/get-candidate').then(response => {
        this.form.full_name.values = response.data[0].full_name;
        this.form.photo.values = response.data[0].photo;
        this.form.profession.values = response.data[0].profession;
        this.form.city.values = response.data[0].city;
        this.city = response.data[0].city;
        this.form.tel.values = response.data[0].tel;
        this.form.email.values = response.data[0].email;
        this.form.birthday.values = response.data[0].birthday;
        this.form.wage.values = response.data[0].wage;
        this.form.skills.values = response.data[0].skills;
        this.form.about.values = response.data[0].about;
        this.form.status.values = response.data[0].status;
      }).catch(err => {
        // console.log(err);
        this.alert_text.push(err);
        this.showResume = true;
      });
      // запрос к апи на вывод информации об образовании по заданному кандидату
      this.axios.get('http://api/'+ this.$route.params.id +'/get-education').then(response => {
        for(let i = 0; i < response.data.length; i++){
          this.addEducationAxios(response.data[i]);
        }
        // console.log(response.data);
      }).catch(err => {
        console.log(err);
        this.alert_text.push(err);
        this.showResume = true;
      });
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
      jsonp('https://api.vk.com/method/database.getCities?country_id=1&need_all=1&count=10&v=5.126&access_token=' +
          process.env.VUE_APP_ACCESS_TOKEN_VK + '&lang=ru&q=' + this.city +'', null, (err, data) => {
        if (err) {
          this.cities = err.message;
        } else {
          this.cities = data.response.items;
        }
      });
    },
    clickCity(index) {
      this.city = this.cities[index].title;
      this.form.city.values = this.city;
      this.cities = [];
    },
    addEducation() {
      this.form.education.push(
          {
            id: {label: 'id', values: ''},
            degree: {label: 'Уровень образования', values: 'Среднее'},
            education_university: {label: 'Учебное заведение', values: ''},
            faculty: {label: 'Факультет', values: ''},
            specialization: {label: 'Специализация', values: ''},
            year_end: {label: 'Год окончания', values: ''},
          }
      );
      if(this.$route.name === 'edit'){
        // добавим в БД запис об образовании
        this.axios({
          method: 'POST',
          url: 'http://api/' + this.$route.params.id + '/add-education',
          data: {
            education: this.form.education[this.form.education.length-1]
          },
          headers: {
            "Content-type": "application/json; charset=UTF-8"
          }
        }).then(response => {
          console.log('response='+response.data);
          // нужно вернуть id-шник
          this.form.education[this.form.education.length-1].id.values = response.data.id_educ;
          console.log('id='+this.form.education[this.form.education.length-1].id.values);
        }).catch(error => {
          console.log('error='+error);
          this.error.push(error);
          this.showResume = false;
        });
      }
    },
    addEducationAxios(dat) {
      this.form.education.push(
          {
            id: {label: 'id', values: dat.id_educ},
            degree: {label: 'Уровень образования', values: dat.degree},
            education_university: {label: 'Учебное заведение', values: dat.education_university},
            faculty: {label: 'Факультет', values: dat.faculty},
            specialization: {label: 'Специализация', values: dat.specialization},
            year_end: {label: 'Год окончания', values: dat.year_end},
          }
      );
    },
    removeEducation(index) {
      // если мы редактируем кандидата, то удаляем из базы сразу образование при клике удаления оразования
      if(this.$route.name === 'edit') {
        this.axios.get('http://api/' + this.form.education[index].id.values +'/delete-education').then(
        response => {
          console.log(response.data)
          // this.alert_text = response.data;
          // this.showResume = true;
        }).catch(err => {
            console.log(err);
            // this.alert_text = err;
            // this.showResume = true;
        });
      }
      this.form.education.splice(index,1);
    },
    onSubmit(event) {
      event.preventDefault();
      // првоерка введёных полей
      this.errors = [];
      let regTel = new RegExp('\\d{' + this.form.tel.values.length + '}', 'gim');
      let regSalary = new RegExp('\\d{' + this.form.wage.values.length + '}', 'gim');
      // валидация номера
      if (this.form.tel.values.length < 6 || this.form.tel.values.length > 10 || !regTel.test(this.form.tel.values)) {
        this.errors.push('Не корректно заполнен номер телефона, он должен состоять от 6 до 10 символов, и содержать только цифры');
      }
      // валидация даты
      if (this.form.birthday.values === '')
        this.errors.push('Укажите дату рождения');

      // валидация даты окончания учёбы
      if(this.form.education.length) {
        for (let i = 0; i < this.form.education.length; i++) {
          if (this.form.education[i].degree.values !== this.degrees[0] && this.form.education[i].degree.values !== '') {
            let regYearEnd = new RegExp('\\d{' + this.form.education[i].year_end.values.length + '}', 'gim');
            if (!regYearEnd.test(this.form.education[i].year_end.values))
              this.errors.push('Не корректно заполнен год окончания');
          }
        }
      }
      // валидация ожидаемой зп
      if (!regSalary.test(this.form.wage.values))
        this.errors.push('Не корректно заполнена ожидаемая ЗП, вводите только цифры');

      // валидация навыков
      if (this.form.skills.values === '')
        this.errors.push('Укажите ваши навыки, хотя бы один');

      // валидация поля о себе
      if (this.form.about.values === '')
        this.errors.push('Укажите хотя бы пару слов о себе');

      // валидация города
      if (this.form.city.values === '')
        this.form.city.values = this.city;

      // если есть ошибки, то выводим их, иначе отправляем post запрос на добавление нового резюме
      if (this.errors.length) {
        this.showResume = false;
      } else {
        // проверка если добавили не одну позицию по среднему образованию (борьба с одинаковыми блоками)
        let countAverangeDegree = 0;
        for (let i = 0; i < this.form.education.length; i++) {
          if (this.form.education[i].degree.values === 'Среднее') {
            countAverangeDegree++;
          }
          if (countAverangeDegree > 1) {
            this.removeEducation(i);
          }
        }
        if (this.$route.name === 'add') {
          // Запрос на добавление резюме
          this.axios({
            method: 'POST',
            url: 'http://api/add',
            data: {
              candidate: this.form
            },
            headers: {
              "Content-type": "application/json; charset=UTF-8"
            }
          }).then(response => {
            this.alert_text.push(response.data);
            this.showResume = true;
          }).catch(error => {
            this.errors.push(error);
            this.showResume = false;
          });
        }
      }
      // вызовем функции добавления записей в БД если у нас роутинг = edit
      if (this.$route.name === 'edit') {
        this.axios({
          method: 'POST',
          url: 'http://api/' + this.$route.params.id + '/edit',
          data: {
            candidate: this.form
          },
          headers: {
            "Content-type": "application/json; charset=UTF-8"
          }
        }).then(response => {
          // console.log(response.data);
          this.alert_text.push(response.data);
          this.showResume = true;
        }).catch(error => {
          // console.log(error);
          this.errors.push(error);
          this.showResume = false;
        });
      }
      if(!this.errors.length)
        this.formActive();
    },
    onReset(event) {
      event.preventDefault();
      // Reset our form values
      this.redacted = true;
      this.alert_text = [];
      this.cities = [];
      this.city = '';
      this.form.full_name.values = '';
      this.form.photo.values = '';
      this.form.profession.values = '';
      this.form.city.values = '';
      this.form.tel.values = '';
      this.form.email.values = '';
      this.form.birthday.values = '';
      this.form.education = [
        {
          id: {label: 'id', values: ''},
          degree: {label:'Уровень образования', values: 'Среднее'},
          education_university: {label:'Учебное заведение', values: ''},
          faculty: {label:'Факультет', values: ''},
          specialization: {label:'Специализация', values: ''},
          year_end: {label:'Год окончания', values: ''},
        }
      ];
      this.form.wage.values = '';
      this.form.skills.values = '';
      this.form.about.values = '';
      this.form.status.values = this.status[0];
      this.showResume = false;
      // Trick to reset/clear native browser form validation state
      this.show = false;
      this.$nextTick(() => {
        this.show = true;
      })
    },
    formActive() {
      this.redacted = !this.redacted;
    }
  }
}
</script>

<style scoped>
.form_col {
  padding: 20px 80px 20px 80px;
}
</style>