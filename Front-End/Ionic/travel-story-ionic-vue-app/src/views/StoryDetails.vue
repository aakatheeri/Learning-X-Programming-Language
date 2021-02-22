<template>

     <base-layout :title="loadedStory.title" page-default-back-link="/tabs/tab1">

               <h2 v-if="!loadedStory">Sorry, could not load the story!</h2>

               <div v-else>

                    <ion-img :src="loadedStory.pictureURL"></ion-img>

                    <div class="ion-padding">

                         <p>{{ loadedStory.description }}</p>

                         <ion-text color="medium">
                              This trip was in <strong>{{ loadedStory.city }}</strong> city.
                         </ion-text>

                    </div>

               </div>

     </base-layout>

</template>

<script>
import { IonImg, IonText } from '@ionic/vue';
import BaseLayout from '../components/BaseLayout.vue';
export default {
     name: 'StoryDetails',
     components: { IonImg, IonText, BaseLayout },
     data() {
          return {
               storyID: parseInt(this.$route.params.id)
          }
     },
     computed: {
          loadedStory() {
               return this.$store.getters.getSelectedStory(this.storyID);
          }
     }
}

</script>
