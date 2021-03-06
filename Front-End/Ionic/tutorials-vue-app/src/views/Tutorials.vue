<template>
  <ion-page>

    <ion-content :fullscreen="true" class="ion-padding">

         <div
               v-for="lesson in lessons"
               :key="lesson.id">

               <ion-text color="primary">
                   <h1 :class="{ lessonLocked: isLessonLocked(lesson.id) }"><strong>{{ lesson.title }}</strong></h1>
               </ion-text>

               <br />

               <ion-grid class="grid-box">
                  <ion-row>
                       <ion-col
                              v-for="session in lesson.sessions"
                              :key="session.id"
                              size="6"
                              @click="openSessionModal($event, session.title, session.id, lesson.id)"
                              :class="{ sessionLocked: isSessionLocked(lesson.id, session.id), sessionOpened: isSessionAvailableImmediately(lesson.id, session.id) }">

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
     created() {

          console.log('Component has been created!');

          // Get current lessons from the store and sign local lessons to them
          this.lessons = this.$store.getters.getCurrentLessons;

          // Update some data that has been initiated
          this.updateData();

     },
     ionViewDidEnter() {

          console.log('Ion view did enter!');

          // Update data once view did enter
          this.updateData();

          // Remove openedSession class
          this.removeHighlightedClassFromOpenedSession();

     },
     methods: {

          // Update any data when needed
          async updateData() {

               // Get the last completed lesson
               this.lastLessonCompleted = parseInt( await appStorage.getItem('lastLessonCompleted') );

               // Get the last completed session
               this.lastSessionCompleted = parseInt( await appStorage.getItem('lastSessionCompleted') );

          },

          // To remove 'openedSession' from available session immediately to the user
          removeHighlightedClassFromOpenedSession() {
               setTimeout(() => {
                    console.log('Fire!');
                    document.getElementsByClassName('sessionOpened')[0].classList.remove('sessionOpened');
               }, 1000);
          },

          // Check if specific session is completed or not

          isSessionAvailableImmediately(lesson_id, session_id) {

               // Make sure the last completed lesson is not null and initiated
               if (this.lastLessonCompleted != null) {

                    // Check on current opened lesson that need to be completed, which come after last completed lesson
                    if ( this.lastLessonCompleted + 1 == lesson_id ) {

                         // Unlock next session based on last completed lesson value if it's greater than or equal selected session
                         if ( this.lastSessionCompleted + 1 == session_id ) {
                              return true;
                         } else {
                              return false;
                         }

                    } else {
                         return false;
                    }

               }

          },
          isSessionLocked(lesson_id, session_id) {

               // Make sure the last completed lesson is not null and initiated
               if (this.lastLessonCompleted != null) {

                    // Check on current opened lesson that need to be completed, which come after last completed lesson
                    if ( this.lastLessonCompleted + 1 == lesson_id ) {

                         // Unlock previous session based on last completed lesson value if it's greater than or equal selected session
                         if ( this.lastSessionCompleted + 1 >= session_id ) {
                              return false;

                         // Otherwise unlock next session on the same lesson until it's completed
                         } else {
                              return true;
                         }

                    // Check on other next and previus lessons
                    } else {

                         // Unlock previous lessons based on last completed lesson value if it's greater than or equal to selected lesson
                         if (this.lastLessonCompleted >= lesson_id) {
                              return false;

                         // Unlock other lessons and sessions - Next lessons and sessions which are not completed
                         } else {
                              return true;
                         }

                    }

               }

          },

          // Check if specific lesson is opened or not
          isLessonLocked(lesson_id) {

               // Check if selected lesson is opened to browse based on last lesson completed value
               if ( this.lastLessonCompleted + 1 >= lesson_id ) {
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

                    modal.onDidDismiss().then(() => {

                         console.log('Modal has been dismissed!');

                         // Update last completed lessons and sessions
                         this.updateData();

                         // Remove openedSession class
                         this.removeHighlightedClassFromOpenedSession();

                    });


                    // Present modal to the view
                    modal.present();

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

ion-col {
     -webkit-transition: color 0.5s ease-out;
     -moz-transition: color 0.5s ease-out;
     -o-transition: color 0.5s ease-out;
     transition: color 0.5s ease-out;

     -webkit-transition: background-color 0.5s ease-out;
     -moz-transition: background-color 0.5s ease-out;
     -o-transition: background-color 0.5s ease-out;
     transition: background-color 0.5s ease-out;
}
ion-col.sessionLocked {
     color: grey;
}

ion-col.sessionOpened {
     color: black;
     background-color: #fdff91;
}

</style>
