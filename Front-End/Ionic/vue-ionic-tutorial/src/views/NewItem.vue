<template>
     <ion-page>
          <ion-header>
               <ion-toolbar>
                    <ion-buttons slot="start">
                         <ion-back-button>

                         </ion-back-button>
                         <ion-title>
                              New Item
                         </ion-title>
                    </ion-buttons>
               </ion-toolbar>
          </ion-header>

          <ion-content class="ion-padding">


               <ion-item>
                    <ion-input placeholder="Task Name"
                         :value="taskName" @input="taskName = $event.target.value">
                    </ion-input>
               </ion-item>

               <ion-item-divider></ion-item-divider>

               <ion-item>
                    <ion-label>
                         Due Date
                    </ion-label>
                    <ion-datetime display-format="D MMM YYYY H:mm" :value="dueDate"
                         @ionChange="dueDate = $event.target.value">

                    </ion-datetime>
               </ion-item>

               <ion-button expand="full" @click="addTask()">
                    Add
               </ion-button>

          </ion-content>
     </ion-page>
</template>

<script>
import {
     IonBackButton,
     IonButtons,
     IonContent,
     IonHeader,
     IonPage,
     IonTitle,
     IonToolbar
} from "@ionic/vue";
import { defineComponent } from "vue";

export default defineComponent ({
     name: "NewItem",
     components: {
          IonBackButton,
          IonButtons,
          IonContent,
          IonHeader,
          IonPage,
          IonTitle,
          IonToolbar,
     },
     data() {
          return {
               taskName: '',
               dueDate: ''
          }
     },
     methods: {
          addTask() {
               console.log(this.taskName);
               console.log(this.dueDate);
          }
     }
});

</script>
