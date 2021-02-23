<template>
  <ion-page>
    <ion-tabs>
      <ion-tab-bar slot="bottom">
        <ion-tab-button tab="tutorials" href="/tabs/tutorials">
          <ion-icon :icon="code" />
          <ion-label>Tutorials</ion-label>
        </ion-tab-button>

        <ion-tab-button tab="statistics" href="/tabs/statistics">
          <ion-icon :icon="statsChart
" />
          <ion-label>Statistics</ion-label>
        </ion-tab-button>

        <ion-tab-button tab="about" href="/tabs/about">
          <ion-icon :icon="informationCircle" />
          <ion-label>About</ion-label>
        </ion-tab-button>
      </ion-tab-bar>
    </ion-tabs>
  </ion-page>
</template>

<script>
import { IonTabBar, IonTabButton, IonTabs, IonLabel, IonIcon, IonPage } from '@ionic/vue';
import { code, statsChart, informationCircle } from 'ionicons/icons';

export default {
  name: 'Tabs',
  components: { IonLabel, IonTabs, IonTabBar, IonTabButton, IonIcon, IonPage },
  setup() {
    return {
      code,
      statsChart,
      informationCircle
    }
  }
}
</script>
