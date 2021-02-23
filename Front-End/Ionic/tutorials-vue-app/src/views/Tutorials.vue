<template>
  <ion-page>

    <!-- <ion-header>
      <ion-toolbar>
        <ion-title>Tab 1</ion-title>
      </ion-toolbar>
    </ion-header> -->
    <ion-content :fullscreen="true" class="ion-padding">

         <div
               v-for="category in categories"
               :key="category.id">

               <ion-text color="primary">
                   <h1><strong>{{ category.title }}</strong></h1>
               </ion-text>

               <br />

               <ion-grid class="grid-box">
                  <ion-row>
                       <ion-col
                              v-for="session in category.sessions"
                              :key="session.id"
                              size="6"
                              @click="openSessionModal(session.title, session.id)">
                            <h5><strong>{{ session.title }}</strong></h5>
                            <p>{{ session.description }}</p>
                       </ion-col>
                  </ion-row>
               </ion-grid>

         </div>

    </ion-content>

  </ion-page>
</template>

<script>
import {
     IonPage,
     IonContent,
     IonText,
     IonGrid,
     IonRow,
     IonCol,
     modalController
} from '@ionic/vue';
import SessionModalView from '../components/SessionModalView.vue';

export default  {
     name: 'Tutorials',
     components: {
          IonContent,
          IonPage,
          IonText,
          IonGrid,
          IonRow,
          IonCol
     },
     data() {
          return {
               categories: {
                    category_1: {
                         title: 'Category 1',
                         sessions: [
                              {
                                   id: 1,
                                   title: 'Session One',
                                   description: 'Quid duis duis illum.',
                                   content: '<p>Some Content</p>'
                              },
                              {
                                   id: 2,
                                   title: 'Session Two',
                                   description: 'Nulla nisi eram labore quae.',
                                   content: '<p>Some Content</p>'
                              },
                              {
                                   id: 3,
                                   title: 'Session Three',
                                   description: 'Quem noster quem anim amet.',
                                   content: '<p>Some Content</p>'
                              },
                              {
                                   id: 4,
                                   title: 'Session Four',
                                   description: 'Tempor ipsum dolor velit fore.',
                                   content: '<p>Some Content</p>'
                              },
                              {
                                   id: 4,
                                   title: 'Session Five',
                                   description: 'Velit quorum dolore enim enim sint.',
                                   content: '<p>Some Content</p>'
                              }
                         ]
                    }
               }
          }
     },
     methods: {
          async openSessionModal(sessionTitle, sessionID) {
               const modal = await modalController
                    .create({
                         component: SessionModalView,
                         componentProps: {
                              title: sessionTitle,
                              id: sessionID
                         }
                    });
               return modal.present();
          }
     }
}
</script>

<style scoped>
.grid-box {
     padding: 0;
     border: 1px solid #cdc5e0;
     background-color: #eae7f1 !important;
     border-radius: 5px;
}

.grid-box ion-col {
     padding: 0 7px !important;
     border-bottom: 1px solid #d7d2e2;
}
.grid-box ion-col:nth-child(odd) {
     border-right: 1px solid #d7d2e2;
}

</style>
