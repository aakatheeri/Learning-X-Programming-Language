<template>
  <ion-page>

    <ion-header>
      <ion-toolbar>
        <ion-title>Travel Stories</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content :fullscreen="true" class="ion-padding">

      <!-- For iOS platform view -->
      <ion-header collapse="condense">
        <ion-toolbar>
          <ion-title size="large">Travel Stories</ion-title>
        </ion-toolbar>
      </ion-header>

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

    </ion-content>

  </ion-page>
</template>

<script>
import {
     IonPage,
     IonHeader,
     IonToolbar,
     IonTitle,
     IonContent,
     IonCard,
     IonCardHeader,
     IonCardSubtitle,
     IonCardTitle,
     IonItem,
     IonThumbnail,
} from '@ionic/vue';

export default  {
     name: 'Tab1',
     components: {
          IonHeader,
          IonToolbar,
          IonTitle,
          IonContent,
          IonPage,
          IonCard,
          IonCardHeader,
          IonCardSubtitle,
          IonCardTitle,
          IonItem,
          IonThumbnail,
     },
     data() {
          return {
               stories: this.$store.getters.getCurrentStories
          }
     }
}
</script>

<style scoped>
.story-item ion-thumbnail {
     min-height: 70px;
}
</style>
