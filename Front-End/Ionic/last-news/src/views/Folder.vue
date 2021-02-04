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
     <ion-content :fullscreen="true" class="ion-padding">

          <div v-if="newsItems.length > 1">

               <!-- Refresher -->
               <ion-refresher slot="fixed" @ionRefresh="doRefresh($event)">
                    <ion-refresher-content
                         :pulling-icon="chevronDownCircleOutline"
                         pulling-text="Pull to refresh"
                         refreshing-spinner="circles"
                         refreshing-text="Refreshing..."></ion-refresher-content>
               </ion-refresher>

              <ion-card button="true"
                   v-for="(item, index) in newsItems" v-bind:key="index">
                   <!-- {{ index }}-->
                  <ion-card-header @click="setDetailsModalOpen(index)">
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
          </div>

          <!-- Skeleton screen -->
          <div v-if="newsItems.length < 1">

               <ion-card class="custom-skeleton ion-padding" v-for="index in 5" :key="index">
                    <ion-skeleton-text class="headline" animated></ion-skeleton-text>
                    <ion-skeleton-text class="date" animated></ion-skeleton-text>

                    <br />

                    <ion-skeleton-text class="like" animated></ion-skeleton-text>

                    <br />

                    <ion-skeleton-text class="content" animated></ion-skeleton-text>
               </ion-card>

          </div>


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
     IonSkeletonText,
     IonRefresher,
     IonRefresherContent,
     modalController
} from '@ionic/vue';
import { heartOutline, chevronDownCircleOutline } from 'ionicons/icons';
import { defineComponent } from 'vue';
import Modal from './Modal.vue';
import axios from 'axios';
import moment from 'moment';

// create a custom event interface to be used for @ionRefresh and doRefresh method
interface CustomEvent {
     target: {
          complete: Function;
     };
}

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
          IonItem,
          IonSkeletonText,
          IonRefresher,
          IonRefresherContent
     },
     data() {
          return {
               newsItems: [], // news items will stored locally here,
          }
     },
     methods: {

          // when user like the news item
          likeItem() {
               console.log('New like!')
          },

          // method to call for open the modal and pass the index of news item index
          async setDetailsModalOpen(index: number) {
               const modal = await modalController
                    .create({
                         component: Modal,
                         componentProps: {
                              title: this.newsItems[index]['title'],
                              content: this.newsItems[index]['content'],
                              description: this.newsItems[index]['description']
                         }
                    })
               console.log('Modal Triggered!');
               return modal.present();
          },

          // return a formatted published date of news item using Moment js library
          publishDate(date: string) {
               return moment(date).format('MMMM Do YYYY, h:mm:ss a');
          },

          // loading new news items
          loadNews() {

               if (this.$route.name == 'BBC News') {

                    // pull new news item using axios library, GET method and pass the Rest API end-point
                    axios.get('https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=aefc046af5bf459fae69d98ec8bc4fed&pageSize=5').then( (response) => {

                         // assign new news items to local newsItems property
                         this.newsItems = response.data.articles;

                         console.log('News items loaded from', this.$route.name,'!');

                    }).catch((error) => {
                         console.error(error);
                    });

               } else if (this.$route.name == 'The Washington Post') {

                    // pull new news item using axios library, GET method and pass the Rest API end-point
                    axios.get('http://newsapi.org/v2/everything?sources=the-washington-post&apiKey=aefc046af5bf459fae69d98ec8bc4fed&pageSize=5').then( (response) => {

                         // assign new news items to local newsItems property
                         this.newsItems = response.data.articles;

                         console.log('News items loaded from', this.$route.name,'!');

                    }).catch((error) => {
                         console.error(error);
                    });

               }

          },

          // call this method when user pull the page to refresh with new news items on the same view
          doRefresh(event: CustomEvent) {
               console.log('Begin Async operation');

               // loading new news items
               this.loadNews();

               // disappear the IonRefresher component after custom seconds
               setTimeout(() => {
                    console.log('Async operation has ended');
                    event.target.complete();
               }, 2000);

          }
     },
     setup() {

          // return icons, reactive properties and methods
          return { heartOutline, chevronDownCircleOutline }
     },

     ionViewWillEnter() {
          console.log('View has been entered!');

          // load new news items once the page on the way to load
          this.loadNews();
     }
})
</script>

<style scoped>
/* Custom Skeleton Line Height and Margin */
.custom-skeleton ion-skeleton-text {
     line-height: 14px;
}

.custom-skeleton ion-skeleton-text.headline {
     width: 60%;
     height: 20px;
     margin-bottom: 12px;
}

.custom-skeleton ion-skeleton-text.date {
     width: 30%
}

.custom-skeleton ion-skeleton-text.like {
     width: 4%;
     height: 30px;
}

.custom-skeleton ion-skeleton-text.content {

}

.custom-skeleton ion-skeleton-text:last-child {
     margin-bottom: 5px;
}

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
