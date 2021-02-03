<template>
  <ion-page>

     <!-- Header -->
     <ion-header :translucent="true">

      <ion-toolbar>

        <ion-buttons slot="start">
          <ion-menu-button color="primary"></ion-menu-button>
        </ion-buttons>

        <ion-title>{{ $route.name }}</ion-title>

      </ion-toolbar>

     </ion-header>

     <!-- Content -->
     <ion-content :fullscreen="true">

         <ion-card button="true"
               v-for="(item, index) in newsItems" v-bind:key="index">
               <!-- {{ index }}-->
              <ion-card-header @click="setDetailsModalOpen()">
                   <ion-card-title>
                        {{ item.title }}
                   </ion-card-title>
                   <ion-card-subtitle>
                       Published at {{ publishDate(item.publishedAt) }}.
                  </ion-card-subtitle>
              </ion-card-header>

              <ion-item>
                   <ion-button fill="clear" class="" @click="likeItem()">
                       <ion-icon :icon="heartOutline" slot="start" size="large"></ion-icon>
                   </ion-button>
              </ion-item>

              <ion-card-content>
                   {{ item.description }}
              </ion-card-content>

         </ion-card>

     </ion-content>

  </ion-page>
</template>

<script lang="ts">
import {
     IonButtons,
     IonButton,
     IonIcon,
     IonContent,
     IonHeader,
     IonMenuButton,
     IonPage,
     IonTitle,
     IonToolbar,
     IonCard ,
     IonCardHeader,
     IonCardTitle,
     IonCardSubtitle,
     IonCardContent,
     IonItem,
     modalController
} from '@ionic/vue';
import { heartOutline } from 'ionicons/icons';
import { defineComponent } from 'vue';
import Modal from './Modal.vue';
import axios from 'axios';
import moment from 'moment';

export default defineComponent({
     name: 'Folder',
     components: {
          IonButtons,
          IonButton,
          IonIcon,
          IonContent,
          IonHeader,
          IonMenuButton,
          IonPage,
          IonTitle,
          IonToolbar,
          IonCard,
          IonCardHeader,
          IonCardTitle,
          IonCardSubtitle,
          IonCardContent,
          IonItem
     },
     data() {
          return {
               newsItems: []
          }
     },
     methods: {
          likeItem() {
               console.log('New like!')
          },
          async setDetailsModalOpen() {
               const modal = await modalController
                    .create({
                         component: Modal,
                         componentProps: {
                              title: 'New Title',
                              content: 'New Content'
                         }
                    })
               console.log('Modal Triggered!');
               return modal.present();
          },
          publishDate(date: string) {
               return moment(date).format('MMMM Do YYYY, h:mm:ss a');
          }
     },
     setup() {
          return { heartOutline }
     },

     ionViewWillEnter() {
          console.log('View has been entered!');

          if (this.$route.name == 'BBC News') {

               axios.get('https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=aefc046af5bf459fae69d98ec8bc4fed&pageSize=5').then( (response) => {
                    this.newsItems = response.data.articles;
               }).catch((error) => {
                    console.error(error);
               });

          } else if (this.$route.name == 'The Washington Post') {

               axios.get('http://newsapi.org/v2/everything?sources=the-washington-post&apiKey=aefc046af5bf459fae69d98ec8bc4fed&pageSize=5').then( (response) => {
                    this.newsItems = response.data.articles;
               }).catch((error) => {
                    console.error(error);
               });

          }

     }
})
</script>

<style scoped>
#container {
  text-align: center;
  position: absolute;
  left: 0;
  right: 0;
  top: 50%;
  transform: translateY(-50%);
}

#container strong {
  font-size: 20px;
  line-height: 26px;
}

#container p {
  font-size: 16px;
  line-height: 22px;
  color: #8c8c8c;
  margin: 0;
}

#container a {
  text-decoration: none;
}
</style>
