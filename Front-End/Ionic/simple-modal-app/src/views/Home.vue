<template>
  <ion-page>
    <ion-header :translucent="true">
      <ion-toolbar>
        <ion-title>Home</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
          <ion-modal :isOpen="modalInfo"
                     @onDidDismiss="showModal(false)">
               <simple-modal></simple-modal>
          </ion-modal>

         <ion-button @click="showModal(true)">
              Show Modal
         </ion-button>

    </ion-content>
  </ion-page>
</template>

<script lang="ts">
import { IonModal, IonContent, IonHeader, IonPage, IonTitle, IonToolbar, IonButton } from '@ionic/vue';
import { defineComponent, ref } from 'vue';
import SimpleModal from "./SimpleModal.vue"

export default defineComponent({
     name: 'Home',
     components: {
          IonModal,
          IonContent,
          IonHeader,
          IonPage,
          IonTitle,
          IonToolbar,
          IonButton,
          SimpleModal
     },
     setup() {
          const modalInfo = ref(false);
          const showModal = (state: boolean) => {
               modalInfo.value = state;
          };
          return { modalInfo, showModal }
     }
});
</script>

<style scoped>
#container {
  text-align: center;

  position: absolute;
  left: 0;
  right: 0;
  top: 50%;
  transform: translateY(-50%);
}

#container strong {
  font-size: 20px;
  line-height: 26px;
}

#container p {
  font-size: 16px;
  line-height: 22px;

  color: #8c8c8c;

  margin: 0;
}

#container a {
  text-decoration: none;
}
</style>
