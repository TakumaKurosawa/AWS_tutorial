<template>
  <v-content>
    <h1>server response ...</h1>
    <h2 class="ml-6">{{ msg }}</h2>
  </v-content>
</template>

<script>
export default {
  async asyncData({ app }) {
    const res = await app.$axios.get('http://api_server:8080/ping')
    return {
      msg: res.data
    }
  }
}
</script>
