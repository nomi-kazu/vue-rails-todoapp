<template>
  <div class="container">
    <TodoList />
  </div>
</template>

<script>
import TodoList from '@/components/TodoList'

export default {
  name: 'TopPage',
  components: {
    TodoList
  }
}
</script>