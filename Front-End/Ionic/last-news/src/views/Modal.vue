<template>

     <ion-header>
          <ion-toolbar>
               <ion-title>
                    {{ title }}
               </ion-title>
               <ion-buttons slot="end">
                    <ion-button @click="dismissModal()">
                         Close
                    </ion-button>
               </ion-buttons>
          </ion-toolbar>
     </ion-header>

     <ion-content class="ion-padding">

          <h2>{{ title }}</h2>

          <p>{{ description }}</p>
          <p>{{ content }}</p>

     </ion-content>

</template>

<script>

import {
     IonContent,
     IonHeader,
     IonTitle,
     IonToolbar,
     IonButtons,
     IonButton,
     modalController
} from '@ionic/vue';
import { defineComponent} from 'vue';

export default defineComponent({
     name: 'Modal',
     props: {
          title: {
               type: String,
               default: 'Super Modal'
          },
          content: {
               type: String,
               default: 'Content'
          },
          description: {
               type: String,
               default: 'Description'
          }
     },
     methods: {
          async dismissModal() {
               return modalController.dismiss();
          }
     },
     components: {
          IonContent,
          IonHeader,
          IonTitle,
          IonToolbar,
          IonButtons,
          IonButton
     }
})

</script>
