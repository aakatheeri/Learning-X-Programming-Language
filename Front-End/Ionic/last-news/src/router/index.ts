import { createRouter, createWebHistory } from '@ionic/vue-router';
import { RouteRecordRaw } from 'vue-router';

const routes: Array<RouteRecordRaw> = [
     {
          path: '/',
          redirect: '/folder/BBCNews'
     },
     {
          path: '/folder/BBCNews',
          name: 'BBC News',
          component: () => import ('../views/Folder.vue')
     },
     {
          path: '/folder/TWP',
          name: 'The Washington Post',
          component: () => import ('../views/Folder.vue')
     }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
