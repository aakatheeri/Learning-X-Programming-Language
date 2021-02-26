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
     </ion-header>

     <ion-content class="ion-padding">

          <!-- <div v-html="session.content"></div> -->

          <ion-slides
               pager="false"
               scrollbar="true"
               :options="slideOpts"
               ref="slides">
               <ion-slide
                    v-for="tutorial in session.content"
                    :key="tutorial.id">
                    <div v-html="tutorial"></div>
               </ion-slide>
          </ion-slides>

     </ion-content>

     <ion-footer class="ion-no-border">
          <ion-button expand="block" color="primary" @click="nextTutorial">{{ nextActionButtonContent}}</ion-button>
     </ion-footer>

</template>

<script>
import { IonHeader, IonToolbar, IonTitle, IonContent, IonIcon, IonButton, IonButtons, IonSlides, IonSlide, IonFooter, modalController, alertController } from '@ionic/vue';
import {defineComponent } from 'vue';
import { close } from 'ionicons/icons';

export default defineComponent ({
     name: 'SessionModalView',
     components: {
          IonHeader, IonToolbar, IonTitle, IonContent, IonIcon, IonButton, IonButtons, IonSlides, IonSlide, IonFooter
     },
     props: ['session_title', 'session_id', 'lesson_id'],
     ionViewDidEnter(){
          console.log('Slides did load!');
     },
     data() {
          return {
               close,
               session: this.$store.getters.getCurrentSession( this.lesson_id, this.session_id),
               nextActionButtonContent: 'Continue',
               currentSlideIndex: 0,
               slideOpts: {
                    initialSlide: 0,
                    speed: 400,
                    allowTouchMove: false,
               }
          }
     },
     // mounted() {
     //
     //      this.$nextTick( async () => {
     //
     //           // event.update();
     //           this.$refs.slides.$el.update();
     //           const length = await this.$refs.slides.$el.length();
     //           console.log(length);
     //
     //      });
     //
     // },
     methods: {
          closeSessionModal() {
               return modalController.dismiss();
          },

          async nextTutorial() {

               if (this.nextActionButtonContent == 'Done') {

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

               }

               const length = await this.$refs.slides.$el.length();
               console.log(this.currentSlideIndex);

               if (this.currentSlideIndex < length - 1) {
                    this.currentSlideIndex++;
                    this.$refs.slides.$el.slideNext();

                    const activeIndex = await this.$refs.slides.$el.getActiveIndex();

                    console.log('Current Slide => ' + this.currentSlideIndex);
                    console.log('Active Slide Index => ' + activeIndex);
                    console.log('Slides Length => ' + length);

               }

               const isEndSlide = await this.$refs.slides.$el.isEnd();
               if (isEndSlide) {
                    console.log('End of slides');
                    this.nextActionButtonContent = 'Done';
                    this.currentSlideIndex = 0;
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
}
</style>
