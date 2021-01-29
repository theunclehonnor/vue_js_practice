<template>
  <b-container>
    <div class="d-flex justify-content-center">
      <b-col cols="6" class="d-flex flex-column align-items-center alert alert-primary">
        <h3 class="mb-3 text-center">Конвертер</h3>
        <b-col cols="8" class="d-flex flex-column align-items-center">
          <div>
            <b-dropdown id="dropdown-1" text="Выберите единицы измерения" variant="primary" class="m-md-2">
              <b-dropdown-item v-for="(dim,index) in dimensionsObj" @click="changeInput(index)" :key="index">{{ dim.label }}</b-dropdown-item>
            </b-dropdown>
          </div>
          <div class="d-flex mt-3 align-items-center">
            <label  class="col-5 text-center">{{dimensionsObj[inputChangeIndex].inputLabel}}:</label>
            <input type="text" class="form-control col-2" v-model="formula" required>
            <label  class="col-5 text-center">= {{+dimensionsObj[inputChangeIndex].outputValues.toFixed(4)}} {{dimensionsObj[inputChangeIndex].outputLabel}}</label>
          </div>
        </b-col>
      </b-col>
    </div>
  </b-container>
</template>

<script>
export default {
  name: "Converter",
  data(){
    return{
      // Объект с единицами измерения
      dimensionsObj:[
        {
          id: 'FutMetre',
          label: 'Футы в метры',
          inputLabel: 'Футы',
          outputLabel: 'Метры',
          inputValues: 0,
          outputValues: 0
        },
        {
          id: 'MoreMillInKilometre',
          label: 'Морские мили в километры',
          inputLabel: 'Морские мили',
          outputLabel: 'Километры',
          inputValues: 0,
          outputValues: 0
        },
        {
          id: 'GradInRad',
          label: 'Градусы в радианы',
          inputLabel: 'Градусы',
          outputLabel: 'Радианы',
          inputValues: 0,
          outputValues: 0
        },
        {
          id: 'TempCelInFar',
          label: 'Температуру по Цельсию в температуру по Фаренгейту',
          inputLabel: 'Цельсия',
          outputLabel: 'Фаренгейт',
          inputValues: 0,
          outputValues: 0
        },
      ],
      // Индекс изменяемого инпута
      inputChangeIndex: 0,
    }
  },
  methods:{
    // Фиксируем изменяемый инпут
    changeInput: function (index) {
      this.inputChangeIndex = index;
    }
  },
  computed:{
    formula: {
      get: function () {
          return this.dimensionsObj[this.inputChangeIndex].inputValues;
      },
      set: function (newInput){
        this.dimensionsObj[this.inputChangeIndex].inputValues = newInput;
        switch (this.inputChangeIndex) {
          case 0:
            // Футы в метры
            this.dimensionsObj[this.inputChangeIndex].outputValues = newInput * 0.3048;
            break;
          case 1:
            // Морские мили в километры
            this.dimensionsObj[this.inputChangeIndex].outputValues = newInput * 1.85;
            break;
          case 2:
            // Градусы в радианы
            this.dimensionsObj[this.inputChangeIndex].outputValues = newInput * 0.017;
            break;
          case 3:
            // Температуру по Цельсию в температуру по Фаренгейту
            this.dimensionsObj[this.inputChangeIndex].outputValues = newInput * 274.15;
            break;
        }
      }
    }
  }
}
</script>

<style scoped>

</style>