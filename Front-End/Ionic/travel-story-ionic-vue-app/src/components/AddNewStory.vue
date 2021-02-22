<template>

          <base-modal-layout title="Add new story">

               <!-- Done Button -->
               <template v-slot:actions-end>
                    <ion-button :disabled="!formIsReady" @click="addStory">Done</ion-button>
               </template>

               <h2>Enter the story details.</h2>

               <form @submit.prevent @keydown="checkForm" @keyup="checkForm">

                    <ion-item>
                         <ion-label position="floating">Story Title</ion-label>
                         <ion-input v-model="enteredTitle"></ion-input>
                    </ion-item>

                    <ion-item>
                         <ion-label position="floating">City</ion-label>
                         <ion-input v-model="enteredCity"></ion-input>
                    </ion-item>

                    <ion-item>
                         <ion-thumbnail slot="start">
                              <img :src="enteredUploadedPicture" />
                         </ion-thumbnail>
                         <!-- <ion-input required="true" v-model="enteredUploadedPicture"></ion-input> -->
                         <ion-button type="submit" fill="clear" @click="uploadPictureFromLibrary">Upload Picture</ion-button>
                    </ion-item>

                    <ion-item>
                         <ion-label position="floating">Description</ion-label>
                         <ion-textarea v-model="enteredDescription"></ion-textarea>
                    </ion-item>

               </form>

          </base-modal-layout>

</template>

<script>
import {
     IonButton,
     IonItem,
     IonLabel,
     IonInput,
     IonTextarea,
     IonThumbnail,
     modalController
} from '@ionic/vue';
// import { defineComponent } from 'vue';
import BaseModalLayout from '../components/BaseModalLayout.vue';
import { Plugins, CameraResultType, CameraSource } from '@capacitor/core';

export default {
     name: 'AddNewStory',
     components: {
          IonButton,
          IonItem,
          IonLabel,
          IonInput,
          IonTextarea,
          IonThumbnail,
          BaseModalLayout
     },
     data() {
          return {
               close,
               enteredTitle: '',
               enteredDescription: '',
               enteredUploadedPicture: '',
               enteredCity: '',
               formIsReady: false
          }
     },
     methods: {
          async addStory () {
               console.log('Add Story');

               if (this.enteredTitle != '' && this.enteredDescription != '' && this.enteredUploadedPicture != '' && this.enteredCity != '') {

                    const storyData = {
                         title: this.enteredTitle,
                         description: this.enteredDescription,
                         city: this.enteredCity,
                         pictureURL: this.enteredUploadedPicture,

                    }

                    this.$store.dispatch('addStory', storyData);
                    await modalController.dismiss(); // check if await can work here!

               } else {
                    alert('Please fill the all fields to add story!');
               }
          },
          checkForm() {

               if (this.enteredTitle != '' && this.enteredDescription != '' && this.enteredUploadedPicture != '' && this.enteredCity != '') {
                    this.formIsReady = true;

               } else {
                    this.formIsReady = false
               }

          },
          async uploadPictureFromLibrary() {
               console.log('Uploading picture');

               const { Camera } = Plugins;

               const image = await Camera.getPhoto({
                    quality: 90,
                    allowEditing: true,
                    resultType: CameraResultType.Uri,
                    source: CameraSource.Photos
               });

               var imageUrl = image.webPath;
               this.enteredUploadedPicture = imageUrl;
               this.checkForm();
          }
     }
}
</script>

<style scoped>
form ion-item {
     --background: transparent !important;
}

form ion-textarea {
     min-height: 120px !important;
}
</style>
