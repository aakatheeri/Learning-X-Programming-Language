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
          :key="story.id">

           <ion-item class="story-item" router-link="/tabs/tab1/1">

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
               stories: [{
                         title: 'Impressive Trip',
                         description: 'This was a amazing trip!',
                         city: 'Amsterdam',
                         pictureURL: 'https://www.travelanddestinations.com/wp-content/uploads/2020/05/People-in-a-car-off-on-a-trip.jpg'
                    },
                    {
                         title: 'Vegans In',
                         description: 'A round trip on Las Vegas!',
                         city: 'Las Vigas',
                         pictureURL: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/90/b1/d5/las-vegas-welcome-sign.jpg?w=1000&h=600&s=1'
                    },
                    {
                         title: 'Romantic Place',
                         description: 'Feeling romantic all day in this trip!',
                         city: 'Malaga',
                         pictureURL: 'https://spanishsabores.com/wp-content/uploads/2015/08/Sunset-Gibralfaro.jpg'
                    },
                    {
                         title: 'Nature and mountains',
                         description: 'Never see the a cold nature and beautiful trip like this!',
                         city: 'Zurich',
                         pictureURL: 'https://www.planetware.com/wpimages/2020/06/switzerland-zurich-to-rhine-falls-3-ways-to-get-there-by-tour.jpg'
               }]
          }
     }
}
</script>

<style scoped>
.story-item ion-thumbnail {
     min-height: 70px;
}
</style>
