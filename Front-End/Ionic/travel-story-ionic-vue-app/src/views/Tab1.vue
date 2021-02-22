<template>

     <base-layout title="Travel Stories">
          <template v-slot:actions-end>
               <ion-button @click="addNewStory">
                    <ion-icon slot="icon-only" :icon="add"></ion-icon>
               </ion-button>
          </template>

          <!-- List of stories -->
          <ion-card
              v-for="story in stories"
              :key="story.id"
               >

               <ion-item class="story-item"
                   :router-link="`/tabs/tab1/${story.id}`"
                   button="true">

                   <ion-thumbnail slot="start">
                        <img :src="story.pictureURL" />
                   </ion-thumbnail>

                   <ion-card-header>
                        <ion-card-subtitle>{{ story.city }}</ion-card-subtitle>
                        <ion-card-title>{{ story.title }}</ion-card-title>
                   </ion-card-header>

               </ion-item>

          </ion-card>

     </base-layout>

</template>

<script>
import {
     IonCard,
     IonCardHeader,
     IonCardSubtitle,
     IonCardTitle,
     IonItem,
     IonThumbnail,
     IonIcon,
     IonButton,
     modalController
} from '@ionic/vue';
import { add } from 'ionicons/icons';
import BaseLayout from '../components/BaseLayout.vue';
import AddNewStory from '../components/AddNewStory.vue';

export default  {
     name: 'Tab1',
     components: {
          IonCard,
          IonCardHeader,
          IonCardSubtitle,
          IonCardTitle,
          IonItem,
          IonThumbnail,
          IonIcon,
          IonButton,
          BaseLayout
     },
     data() {
          return {
               stories: this.$store.getters.getCurrentStories,
               add
          }
     },
     methods: {
          async addNewStory() {
               console.log('Add new story');

               const modal = await modalController.create({
                    component: AddNewStory
               });
               return modal.present();
          }

     }
}
</script>

<style scoped>
.story-item ion-thumbnail {
     min-height: 70px;
}
</style>
