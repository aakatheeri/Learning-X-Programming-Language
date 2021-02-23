<template>

     <ion-header>
          <ion-toolbar>
               <ion-buttons slot="start">
                    <ion-button @click="closeSessionModal">
                         <ion-icon slot="icon-only" :icon="close"></ion-icon>
                    </ion-button>
               </ion-buttons>
               <ion-title>{{ title }}</ion-title>
          </ion-toolbar>
     </ion-header>

     <ion-content class="ion-padding">

          <p>
               {{ content }}
          </p>

          <p>
               Session ID => {{ id }}
          </p>
     </ion-content>

</template>

<script>
import { IonHeader, IonToolbar, IonTitle, IonContent, modalController } from '@ionic/vue';
import { close } from 'ionicons/icons';
export default {
     name: 'SessionModalView',
     components: {
          IonHeader, IonToolbar, IonTitle, IonContent
     },
     props: ['title', 'id'],
     data() {
          return {
               content: 'Content here!',
               close
          }
     },
     methods: {
          closeSessionModal() {
               return modalController.dismiss();
          }
     }
}
</script>
