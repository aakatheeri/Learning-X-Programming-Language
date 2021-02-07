<template>
     <ion-page v-if="isIntroEnabled" style="z-index: 1; transition: .5s;" class="ion-page" :class="{ 'hidePage': isIntroHide}">
          <ion-content :fullscreen="true" class="ion-padding" scroll-y="false">

               <ion-slides pager="true" :options="slideOpts">

                         <ion-slide>

                              <div>
                                   <div class="circle-shape">
                                        <h2>Lrem</h2>
                                   </div>

                                   <h1>Minim dolore tempor</h1>
                                   <p>
                                        Summis enim esse ipsum fugiat quorum magna tempor cillum elit sunt multos fore
                                        nulla sint eram tamen illum nulla elit.
                                   </p>
                                   <br />
                              </div>

                         </ion-slide>

                         <ion-slide>

                              <div>
                                   <div class="circle-shape">
                                        <h2>Spaion <br /> Gen</h2>
                                   </div>

                                   <h1>Nulla quem</h1>
                                   <p>
                                        Puae eram summis aliqua magna fugiat eram legam magna sunt sunt labore fore
                                        velit irure quorum quem amet fore amet veniam tempor multos irure multos dolore.
                                   </p>
                                   <br />
                              </div>

                         </ion-slide>

                         <ion-slide>
                              <div>
                                   <div class="circle-shape">
                                        <h2>Fero <br />Den</h2>
                                   </div>
                                   <h1>Legam multos quem anim</h1>
                                   <p>
                                        Cillum culpa tempor tempor sint nisi dolor culpa legam quem quae quorum irure
                                        eram minim esse veniam cillum anim export ipsum tamen multos esse cillum.
                                   </p>
                                   <br />
                              </div>

                         </ion-slide>

                         <ion-slide>
                              <div>
                                   <div class="circle-shape">
                                        <h2>Nothing to lose</h2>
                                   </div>
                                   <h1>Multos aliqua</h1>
                                   <p>
                                        Culpa noster nulla fugiat cillum fore sint sint sunt quis quorum export culpa
                                        quem quem aliqua multos ipsum quorum quid noster quem nulla summis anim aute.
                                   </p>
                                   <br />
                                   <!-- <ion-button size="large" fill="clear"
                                        href="/folder/BBCNews" routerDirection="root">
                                        Continue <ion-icon slot="end" :icon="arrowForward"></ion-icon>
                                   </ion-button> -->

                                   <ion-button size="large" fill="clear"
                                   router-direction="root" @click="hideSlides">
                                        Continue <ion-icon slot="end" :icon="arrowForward"></ion-icon>
                                   </ion-button>
                              </div>

                         </ion-slide>

               </ion-slides>

          </ion-content>
     </ion-page>
</template>

<script lang="ts">
import { IonPage, IonContent, IonSlides, IonSlide, IonButton, IonIcon } from '@ionic/vue';
import { arrowForward } from 'ionicons/icons';
import { Plugins } from '@capacitor/core';
import { defineComponent } from 'vue';

export default defineComponent({
     components: { IonPage, IonContent, IonSlides, IonSlide, IonButton, IonIcon },
     data() {
          return {
               isIntroEnabled: true,
               isIntroHide: false,
          }
     },
     methods: {
          hideSlides() {

               this.isIntroHide = true;

               setTimeout(() => {
                    this.isIntroEnabled = false;

                    const { Storage } = Plugins;
                    Storage.set({
                         key: 'IntroShowOnce',
                         value: 'true'
                    });

               }, 500);
          }
     },
     setup() {

          // Optional parameters to pass to the swiper instance.
          const slideOpts = {
               initialSlide: 1,
               speed: 400
          };

          return { slideOpts, arrowForward }
     }
});

</script>

<style>

.hidePage {
     right: 835px !important;
     opacity: 0;
}
ion-slides {
     height: 100%;
}
ion-slide {
     height: 100%;
     align-items: center;
     justify-content: center;
}
.swiper-slide {
     display: flex;
}

ion-slide div {
     width: 75%;
}

ion-slide div h1 {
     font-size: 2.2rem;
}
.circle-shape {
     height: 12rem;
     width: 12rem;
     background-color: rgb(82 82 103 / 50%);
     border-radius: 50%;
     display: inline-block;
     border: 1rem solid rgb(22 22 25 / 50%);
     position: relative;
     overflow: hidden;
}

.circle-shape h2 {
     opacity: 0.5;
     font-size: 3.5rem;
     position: absolute;
     transform: rotateZ(-15deg);
}
.circle-shape:before {
     /* content: 'empty'; */
}
</style>
