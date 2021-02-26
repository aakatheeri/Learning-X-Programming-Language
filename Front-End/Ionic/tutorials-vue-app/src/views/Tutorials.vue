<template>
  <ion-page>

    <!-- <ion-header>
      <ion-toolbar>
        <ion-title>Tab 1</ion-title>
      </ion-toolbar>
    </ion-header> -->
    <ion-content :fullscreen="true" class="ion-padding">

         <div
               v-for="lesson in lessons"
               :key="lesson.id">

               <ion-text color="primary">
                   <h1><strong>{{ lesson.title }}</strong></h1>
               </ion-text>

               <br />

               <ion-grid class="grid-box">
                  <ion-row>
                       <ion-col
                              v-for="session in lesson.sessions"
                              :key="session.id"
                              size="6"
                              @click="openSessionModal(session.title, session.id, lesson.id)">
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
               lessons: null
          }
     },
     mounted() {
          this.$nextTick(() => {
               this.lessons = this.$store.getters.getCurrentLessons;
          });

     },
     methods: {
          async openSessionModal(sessionTitle, sessionID, lessonID) {
               const modal = await modalController
                    .create({
                         component: SessionModalView,
                         componentProps: {
                              session_title: sessionTitle,
                              session_id: sessionID,
                              lesson_id: lessonID
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
