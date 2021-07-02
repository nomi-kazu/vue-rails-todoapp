<template>
  <div class="field is-grouped mt-6">
    <p>
      <input v-model="todo.title" class="input" type="text" placeholder="Add Todo">
    </p>
    <p class="control">
      <a class="button is-link" @click="createTodo">
        Add
      </a>
    </p>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'TodoList',
  data() {
    return {
      todo: {
        title: ''
      }
    }
  },
  methods: {
    createTodo: function() {
      axios
        .post('http://localhost:5000/v1/todos')
        .then(response => {
          console.log('Created!');
        })
    }
  }
}
</script>