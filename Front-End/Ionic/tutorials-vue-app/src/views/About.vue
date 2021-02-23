<template>
     <ion-page>

          <ion-header>
               <ion-toolbar>
                    <ion-title>About</ion-title>
               </ion-toolbar>
          </ion-header>

          <ion-content :fullscreen="true" class="ion-padding">

          <!-- iOS View -->
          <ion-header collapse="condense">
               <ion-toolbar>
                    <ion-title size="large">About</ion-title>
               </ion-toolbar>
          </ion-header>


          <ion-text color="primary">
               <h1>About the app</h1>
          </ion-text>

          <p>
               Singulis sint nisi qui multos. Est anim ad malis, enim non voluptate, tempor
               instituendarum fabulas quae officia, nostrud dolor cupidatat de do occaecat
               instituendarum o ipsum ullamco a fugiat aliqua si pariatur quid si senserit
               instituendarum nam consequat sint quorum do magna. Nam ita quis nulla esse ex
               quamquam.
          </p>

          <p>
               Et quae ab quorum, te quem export eu aliquip aut veniam consectetur incurreret
               irure cernantur, eram consequat pariatur. Tempor constias litteris, iis quorum
               aliquip, nam anim esse et possumus, cillum nostrud philosophari qui legam
               voluptate et mentitum ex e tamen ita noster o tamen appellat nam cupidatat ne
               nam aliquip e voluptate.
          </p>

          <p>
               Fore elit quem eram quorum malis cillum elit enim malis dolore tempor aute
               dolore quem esse quae export nisi malis minim quid anim quae cillum anim magna
               dolore illum fugiat.
          </p>


          </ion-content>

     </ion-page>
</template>

<script>
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent, IonText } from '@ionic/vue';

export default  {
  name: 'About',
  components: { IonHeader, IonToolbar, IonTitle, IonContent, IonPage, IonText }
}
</script>
