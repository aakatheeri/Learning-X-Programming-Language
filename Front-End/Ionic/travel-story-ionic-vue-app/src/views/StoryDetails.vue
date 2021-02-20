<template>
     <ion-page>

          <ion-header>
            <ion-toolbar>
               <ion-buttons slot="start">
                    <ion-back-button></ion-back-button>
               </ion-buttons>
               <ion-title>{{ loadedStory ? loadedStory.title : 'Loading..' }}</ion-title>
            </ion-toolbar>
          </ion-header>

          <ion-content>

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

          </ion-content>

     </ion-page>
</template>

<script>
import { IonPage, IonContent, IonHeader, IonToolbar, IonButtons, IonBackButton, IonTitle, IonImg, IonText } from '@ionic/vue';
export default {
     name: 'StoryDetails',
     components: { IonPage, IonContent, IonHeader, IonToolbar, IonButtons, IonBackButton, IonTitle, IonImg, IonText },
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
