<template>
     <div class="root">
          <p>Showing {{ filteredTitles.length }} results for "{{ query }}" </p>
          <ul>
               <li v-for="title in filteredTitles" :key="title.Page">
                    {{ title.Name }}
               </li>
          </ul>
     </div>
</template>

<script>

import { computed } from 'vue'
import titles from '../post-data.json'

export default {
     // name: 'SearchResults',
     props: {
          query: String
     },
     setup(props) {

          const filteredTitles = computed( () => {
               return titles.filter( s =>
                    s.Name.toLowerCase().includes( props.query.toLowerCase() )
               )
          })

          return {
               filteredTitles
          }

     }
}

</script>
