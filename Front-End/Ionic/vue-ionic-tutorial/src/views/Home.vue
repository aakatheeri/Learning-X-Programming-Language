<template>
  <ion-page>
    <ion-header :translucent="true">
      <ion-toolbar>
        <ion-title>Blank</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">

         <ion-list>
              <ion-item>
                   <ion-checkbox style="margin-right: 1em" />

                       <ion-label>
                            <h1>Create Idea</h1>
                       </ion-label>

                       <ion-badge color="success">
                            5 Days
                       </ion-badge>

              </ion-item>
         </ion-list>

         <ion-fab vertical="bottom" horizontal="end" slot="fixed">
              <ion-fab-button @click="() => router.push('/new')">
                   <ion-icon :icon="add"/>
              </ion-fab-button>
         </ion-fab>

    </ion-content>
  </ion-page>
</template>

<script lang="ts">
import { add } from "ionicons/icons";
import {
     IonContent,
     IonHeader,
     IonPage,
     IonTitle,
     IonToolbar,
     IonIcon,
     IonCheckbox,
     IonLabel,
     IonBadge,
     IonItem,
     IonList,
     IonFabButton,
     IonFab
} from '@ionic/vue';
import { defineComponent } from 'vue';
import { useRouter } from "vue-router";

export default defineComponent({
  name: 'Home',
  components: {
          IonContent,
          IonHeader,
          IonPage,
          IonTitle,
          IonToolbar,
          IonIcon,
          IonCheckbox,
          IonLabel,
          IonBadge,
          IonItem,
          IonList,
          IonFabButton,
          IonFab
  },
  setup() {
       const router = useRouter();
       return { add, router };
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
