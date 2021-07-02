<template>
  <div>
    <div class="field is-grouped mt-6">
      <p class="control is-expanded">
        <input v-model="todo.title" class="input" type="text" placeholder="Add Todo">
      </p>
      <p class="control">
        <a class="button is-link" @click="createTodo">
          Add
        </a>
      </p>
    </div>
    <div class="content">
      <ul v-for="todo in todos" :key="todo.id">
        <li>{{ todo.title }}</li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'TodoList',
  data() {
    return {
      todos: [],
      todo: {
        title: ''
      }
    }
  },
  mounted() {
    axios
      .get('http://localhost:5000/v1/todos')
      .then(response => {
        this.todos = response.data;
      })
  },
  methods: {
    createTodo: function() {
      axios
        .post('http://localhost:5000/v1/todos', this.todo)
        .then(response => {
          this.updateTodos();
          this.todo.title = '';
        })
    },
    updateTodos: function() {
      axios
        .get('http://localhost:5000/v1/todos')
        .then(response => {
          this.todos = response.data;
        })
    }
  }
}
</script>