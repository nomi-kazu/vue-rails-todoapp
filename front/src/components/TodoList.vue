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
        <li>
          {{ todo.title }}
          <button @click="openModal(todo)">Edit</button>
          <button @click="destroyTodo(todo.id)">Delete</button>
        </li>
      </ul>
    </div>

    <div v-bind:class="{ 'is-active': modalActive }" class="modal">
      <div class="modal-background"></div>
      <div class="modal-content">
        <div class="field is-grouped mt-6">
          <p class="control is-expanded">
            <input v-model="editTodo.title" class="input" type="text">
          </p>
          <p class="control">
            <a class="button is-link">
              update
            </a>
          </p>
        </div>
      </div>
      <button @click="closeModal" class="modal-close is-large" aria-label="close"></button>
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
      },
      modalActive: false,
      editTodo: {
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
    },
    destroyTodo: function(id) {
      axios
        .delete(`http://localhost:5000/v1/todos/${id}`)
        .then(response => {
          this.updateTodos();
        })
    },
    openModal: function(todo) {
      this.editTodo = todo;
      this.modalActive = true;
    },
    closeModal: function() {
      this.editTodo = '';
      this.modalActive = false;
    }
  }
}
</script>