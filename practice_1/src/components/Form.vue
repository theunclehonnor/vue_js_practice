<template>
  <b-container class="form">
    <div class="d-flex">
      <b-col class="form_col form-input">
        <div>
          <b-form @reset="onReset" v-if="show">
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
                    v-model="form.city.values"
                    type="text"
                    placeholder="Липецк"
                    required
                ></b-form-input>
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
<!--https://yandex.ru/images/search?pos=0&img_url=https%3A%2F%2Fpbs.twimg.com%2Fmedia%2FCQtJ7J5VAAAt0hA.jpg&text=ава&lr=9&rpt=simage&source=wiz-->
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
                  placeholder="7999123456"
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
            <b-form-group id="input-group-degree" :label="form.degree.label+':'" label-for="input-degree">
              <b-form-select
                  id="input-degree"
                  v-model="form.degree.values"
                  :options="degrees"
                  required
              ></b-form-select>
            </b-form-group>
            <b-form-group id="input-group-educationUniversity" :label="form.educationUniversity.label+':'" label-for="input-educationUniversity">
              <b-form-input
                  id="input-educationUniversity"
                  v-model="form.educationUniversity.values"
                  placeholder="Липецкий государственный технический университет"
                  required
              ></b-form-input>
            </b-form-group>
            <b-form-group id="input-group-faculty" :label="form.faculty.label+':'" label-for="input-faculty">
              <b-form-input
                  id="input-faculty"
                  v-model="form.faculty.values"
                  placeholder="Автоматизациии и информатики"
                  required
              ></b-form-input>
            </b-form-group>
            <b-form-group id="input-group-specialization" :label="form.specialization.label+':'" label-for="input-specialization">
              <b-form-input
                  id="input-specialization"
                  v-model="form.specialization.values"
                  placeholder="Математическое обеспечение и администрирование информационных систем"
                  required
              ></b-form-input>
            </b-form-group>
            <b-form-group
                id="input-group-yearEnd"
                :label="form.yearEnd.label+':'"
                label-for="input-yearEnd"
                description="Если учитесь в настоящее время — укажите год предполагаемого окончания"
            >
              <b-form-input
                  id="input-yearEnd"
                  v-model="form.yearEnd.values"
                  placeholder="2021"
                  required
              ></b-form-input>
            </b-form-group>
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
                  placeholder="100 000"
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

<!--            <b-button type="submit" variant="primary">Submit</b-button>-->
            <b-button type="reset" variant="danger">Сбросить</b-button>
          </b-form>
        </div>
      </b-col>
      <b-col class="form_col form-output">
        <h2 class="text-center">Резюме</h2>
        <div class="">
          <div class="d-flex justify-content-center"><img :src="form.photo.values" alt="" class="img_size"></div>
          <p class="mb-2" v-for="(f,index) in form" :key="index">
            <template v-if="f.label !== 'Ссылка на фото'">{{f.label}}: {{f.values}}</template>
          </p>
        </div>
      </b-col>
    </div>
  </b-container>
</template>

<script>

export default {
  name: "Form",
  data() {
    return {
      form: {
        fullName: {label:'ФИО', values: ''},
        photo: {label:'Ссылка на фото', values: 'https://bez-makiyazha.ru/wp-content/uploads/2020/07/KERRI_Dzhim15.jpg'},
        profession: {label:'Профессия', values: ''},
        city: {label:'Город', values: ''},
        tel: {label:'Номер телефона', values: ''},
        email: {label:'Почта', values: ''},
        dateBirthday: {label:'Дата рождения', values: ''},
        degree: {label:'Уровень образования', values: null},
        educationUniversity: {label:'Учебное заведение', values: ''},
        faculty: {label:'Факультет', values: ''},
        specialization: {label:'Специализация', values: ''},
        yearEnd: {label:'Год окончания', values: ''},
        salary: {label:'Ожидаемая заработная плата', values: ''},
        skills: {label:'Навыки', values: ''},
        aboutMe: {label:'О себе', values: ''},
      },
      degrees: ['Среднее', 'Среднее специальное', 'Неоконченное высшее', 'Высшее', 'Бакалавр','Магистр','Кандидат наук','Доктор наук',],
      show: true
    }
  },
  methods: {
    // onSubmit(event) {
    //   event.preventDefault()
    //   alert(JSON.stringify(this.form))
    // },
    onReset(event) {
      event.preventDefault()
      // Reset our form values
      this.form.email = ''
      this.form.name = ''
      this.form.food = null
      this.form.checked = []
      // Trick to reset/clear native browser form validation state
      this.show = false
      this.$nextTick(() => {
        this.show = true
      })
    },
  },
}
</script>

<style scoped>
.form_col {
  padding: 20px 100px 20px 100px;
}
.img_size {
  max-width: 250px;
  max-height: 250px;
}
</style>