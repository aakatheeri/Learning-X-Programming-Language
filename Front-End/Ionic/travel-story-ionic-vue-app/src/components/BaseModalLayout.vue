<template>

     <ion-header>
          <ion-toolbar>

               <ion-buttons slot="start">
                    <ion-button @click="closeModal">
                         <ion-icon slot="icon-only" :icon="close"></ion-icon>
                    </ion-button>
               </ion-buttons>

               <ion-title>{{ title }}</ion-title>

               <ion-buttons slot="end">
                    <slot name="actions-end" />
               </ion-buttons>

          </ion-toolbar>
     </ion-header>

     <ion-content class="ion-padding">

          <slot />

     </ion-content>

</template>

<script>
import {
     IonHeader,
     IonContent,
     IonTitle,
     IonToolbar,
     IonButtons,
     IonButton,
     IonIcon,
     modalController
} from '@ionic/vue';
// import { defineComponent } from 'vue';
import { close } from 'ionicons/icons';

export default {
     name: 'BaseModalLayout',
     components: {
          IonHeader,
          IonContent,
          IonTitle,
          IonToolbar,
          IonButtons,
          IonButton,
          IonIcon
     },
     props: ['title'],
     data() {
          return {
               close,
          }
     },
     methods: {
          closeModal () {
               console.log('Close Modal');
               modalController.dismiss();
          },
     }
}
</script>
