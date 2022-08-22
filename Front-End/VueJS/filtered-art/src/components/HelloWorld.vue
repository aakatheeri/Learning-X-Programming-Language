<template>

     <div>
          <h2>Filter LearnVue Articles</h2>
          <input type="text" placeholder="Filter Search" v-model="query" />
          <br />
          <button @click="reset">Reset</button>
          <br />
          <br />
          <SearchResults :query="query"></SearchResults>
     </div>

</template>

<script>
import { ref } from 'vue'
import SearchResults from './SearchResults.vue'

export default {
     name: 'HelloWorld',
     components: {
          SearchResults
     },
     setup() {

          const query = ref('');

          const reset = () => {
               query.value = '' // clears the querty
          }

          return {
               query,
               reset
          }
     }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
input[type=text] {
     padding: 10px;
     min-width: 300px;
     margin-bottom: 20px;
}
</style>
