<template>
     <ion-page>

          <ion-header>
               <ion-toolbar>
                    <ion-buttons slot="start">
                         <ion-back-button :default-href="pageDefaultBackLink"></ion-back-button>
                    </ion-buttons>

                    <ion-title>{{ title }}</ion-title>

                    <ion-buttons slot="end">
                        <slot name="actions-end" />
                    </ion-buttons>

               </ion-toolbar>
          </ion-header>

          <ion-content :fullscreen="true" class="ion-padding">

               <!-- For iOS platform view -->
               <ion-header collapse="condense">
                 <ion-toolbar>
                   <ion-title size="large">Travel Stories</ion-title>
                 </ion-toolbar>
               </ion-header>

               <slot />

          </ion-content>
          
     </ion-page>
</template>

<script>
import { IonPage, IonContent, IonHeader, IonToolbar, IonButtons, IonBackButton, IonTitle } from  '@ionic/vue';
export default {
     name: 'BaseLayout',
     components: { IonPage, IonContent, IonHeader, IonToolbar, IonButtons, IonBackButton, IonTitle },
     props: ['title', 'pageDefaultBackLink']
}

</script>
