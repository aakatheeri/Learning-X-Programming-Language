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
                   <h1 :class="{ lessonLocked: isLessonOpened(lesson.id) }"><strong>{{ lesson.title }}</strong></h1>
               </ion-text>

               <br />

               <ion-grid class="grid-box">
                  <ion-row>
                       <ion-col
                              v-for="session in lesson.sessions"
                              :key="session.id"
                              size="6"
                              @click="openSessionModal($event, session.title, session.id, lesson.id)"
                              :class="{ sessionLocked: isSessionCompleted(lesson.id, session.id) }">

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
import appStorage from '../storage';

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
               lessons: null,
               lastLessonCompleted: null,
               lastSessionCompleted: null
          }
     },
     mounted() {

          // Performing a task (get current lessons from the store) once DOM is updated
          this.$nextTick( async () => {

               // Get current lessons from the store and sign local lessons to them
               this.lessons = this.$store.getters.getCurrentLessons;

               // Get the last completed lesson
               this.lastLessonCompleted = await appStorage.getItem('lastLessonCompleted');

               // Get the last completed session
               this.lastSessionCompleted = await appStorage.getItem('lastSessionCompleted');

          });

     },
     methods: {

          // Check if specific session is completed or not
          isSessionCompleted(lesson_id, session_id) {

               if ( parseInt(this.lastLessonCompleted) + 1 >= lesson_id ) {

                    if ( parseInt(this.lastSessionCompleted) + 1 >= session_id ) {
                         return false;
                    } else {
                         return true;
                    }

               }

          },

          // Check if specific lesson is opened or not
          isLessonOpened(lesson_id) {

               // Check if selected lesson is opened to browse based on last lesson completed value
               if ( parseInt(this.lastLessonCompleted) + 1 >= lesson_id ) {
                    return false;
               } else {
                    return true;
               }
          },

          // Open a modal when user tap on a single session
          async openSessionModal(event, sessionTitle, sessionID, lessonID) {

               // Allow for opened sessions to be tappable

               if ( !event.currentTarget.classList.contains('sessionLocked') ) {
                    const modal = await modalController
                         .create({
                              component: SessionModalView,
                              componentProps: {
                                   session_title: sessionTitle,
                                   session_id: sessionID,
                                   lesson_id: lessonID
                              }
                         });

                    // Present modal to the view
                    return modal.present();

               }

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

h1.lessonLocked {
     color: grey;
}

ion-col.sessionLocked {
     color: grey;
}

</style>
