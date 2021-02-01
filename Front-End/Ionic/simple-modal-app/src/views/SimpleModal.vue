<template>

  <ion-page>
    <ion-header :translucent="true">
      <ion-toolbar>
        <ion-title>{{ title }}</ion-title>
        <ion-buttons slot="end">
             <ion-button @click="dismissModal()">Close</ion-button>
        </ion-buttons>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
         {{ content }}
    </ion-content>
  </ion-page>

</template>

<script lang="ts">
import {
     IonPage,
     IonContent,
     IonHeader,
     IonToolbar,
     IonTitle,
     IonButtons,
     IonButton,
     modalController
} from '@ionic/vue';
import { defineComponent } from 'vue';

export default defineComponent({
     name: 'simple-modal',
     components: {
          IonPage,
          IonContent,
          IonHeader,
          IonToolbar,
          IonTitle,
          IonButtons,
          IonButton
     },
     props: {
          title: {
               type: String,
               default: 'Simple Modal'
          }
     },
     data() {
          return {
               content: 'Content'
          }
     },
     methods: {
          dismissModal: () => {
               modalController.dismiss();
          }
     }
});
</script>

<style scoped>

</style>
