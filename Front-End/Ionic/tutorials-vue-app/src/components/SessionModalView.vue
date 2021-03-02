<template>

     <ion-header>
          <ion-toolbar>
               <ion-buttons slot="start">
                    <ion-button @click="closeSessionModal">
                         <ion-icon slot="icon-only" :icon="close"></ion-icon>
                    </ion-button>
               </ion-buttons>
               <ion-title>{{ session_title }}</ion-title>

          </ion-toolbar>

          <!-- Progress bar used to let user know the of sessions completion progress -->
          <ion-progress-bar :value="currentSlidesProgress"></ion-progress-bar>

          <span class="tutorial-number">{{ currentTutorialNumber }}</span>

     </ion-header>



     <ion-content ref="tutorialContent" class="ion-padding" scrollEvents="true">



          <ion-slides
               pager="false"
               scrollbar="false"
               :options="slideOpts"
               ref="slides"
               v-if="showSlides">
               <ion-slide
                    v-for="tutorial in session.content"
                    :key="tutorial.id">
                    <div v-html="tutorial"></div>
               </ion-slide>
          </ion-slides>

     </ion-content>

     <ion-footer class="ion-no-border">
          <!-- Next action from the user after finish the tutorial -->
          <ion-button :disabled="isNextActionButtonDisabled" expand="block" color="primary" @click="nextTutorial">{{ nextActionButtonContent}}</ion-button>
     </ion-footer>

</template>

<script>
import { IonHeader, IonToolbar, IonTitle, IonContent, IonIcon, IonButton, IonButtons, IonSlides, IonSlide, IonFooter, IonProgressBar, modalController, alertController } from '@ionic/vue';
import {defineComponent } from 'vue';
import { close } from 'ionicons/icons';

export default defineComponent ({
     name: 'SessionModalView',
     components: {
          IonHeader, IonToolbar, IonTitle, IonContent, IonIcon, IonButton, IonButtons, IonSlides, IonSlide, IonFooter, IonProgressBar
     },
     // Properties used to get specific data from parent component
     props: ['session_title', 'session_id', 'lesson_id'],
     data() {
          return {
               close,
               session: this.$store.getters.getCurrentSession( this.lesson_id, this.session_id),
               nextActionButtonContent: '',
               isNextActionButtonDisabled: false,
               currentTutorialNumber: 1,
               currentSlideIndex: 0,
               currentSlidesProgress: 0,
               showSlides: false,
               slideOpts: {
                    initialSlide: 0,
                    speed: 400,
                    allowTouchMove: false,
               }
          }
     },
     created() {
          // Decide which next action button content will be based on number of slides / tutorials
          this.nextActionButtonContent = this.session.content.length == 1 ? 'Done' : 'Continue';
     },
     async mounted() {

          setTimeout( () => {
               this.showSlides = true;
          }, 30);

     },
     methods: {

          // Close and exit session modal
          closeSessionModal() {
               return modalController.dismiss();
          },

          async nextTutorial() {

               // Disable next tutorial button
               this.isNextActionButtonDisabled = true;

               // Get the current slides length
               const slidesLength = await this.$refs.slides.$el.length();

               // Prepapre a message of session is finished and action button titled 'Done'
               if (this.nextActionButtonContent == 'Done') {

                    // Update the current slides progress
                    this.currentSlidesProgress = 1;

                    setTimeout(async () => {

                         // create an alert to show a completion message
                         const alert = await alertController
                              .create({
                                   header: 'Well Done!',
                                   subHeader: 'You finished this session.',
                                   buttons: [{
                                        text: 'Continue to learn',
                                        handler: () => {
                                             modalController.dismiss();
                                        }
                                   }]
                              });
                         return alert.present();

                    }, 500);

               }

               // If slides not completed, continue move to next slide and update the progress
               if (this.currentSlideIndex < slidesLength && this.nextActionButtonContent != 'Done') {

                    // Increment current slide index by 1
                    this.currentSlideIndex++;

                    // Move to next slide
                    this.$refs.slides.$el.slideNext();

                    this.currentTutorialNumber = await this.$refs.slides.$el.getActiveIndex() + 1;

                    // Update current slides progress
                    this.currentSlidesProgress = this.currentSlideIndex / slidesLength;

                    // Scroll the content to top, once user move to next slide next tutorial
                    setTimeout(() => {

                         // scroll tutorial content to the top
                         this.$refs.tutorialContent.$el.scrollToTop();

                         // Enable next tutorial button
                         this.isNextActionButtonDisabled = false;

                    }, 50);

                    // Check if user reach to the end of slide
                    const isEndSlide = await this.$refs.slides.$el.isEnd();
                    if (isEndSlide) {
                         // Set next action button to 'Done'
                         this.nextActionButtonContent = 'Done';

                         // Reset current slide Index to 0 (the first slide)
                         this.currentSlideIndex = 0;
                    }


                    // const activeIndex = await this.$refs.slides.$el.getActiveIndex();
                    // console.log('Current Slide => ' + this.currentSlideIndex + '\nActive Slide Index => ' + activeIndex + '\nSlides Length => ' + slidesLength);


               }

          }


     }
})
</script>

<style scoped>
hr {
     background-color: gainsboro !important;
}

ion-footer {
     height: 3.8rem;
}

ion-footer ion-button {
     margin-top: 0.4rem;
     min-height: 3rem;
}

ion-slides {

}

ion-slide {
     height: 100%;
     display: block;
     text-align: left;
}

ion-header {
     margin-bottom: 0.3rem;
}

.tutorial-number {
     display: inline-block;
     background: yellow;
     color: black;
     min-width: 2rem;
     padding: 10px;
     font-weight: 700;
     position: absolute;
     top: 61px;
     right: 0;
     z-index: 10;
     box-shadow: -1px 2px 4px 0px grey;
}
</style>
