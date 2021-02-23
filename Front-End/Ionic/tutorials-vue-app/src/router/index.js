import { createRouter, createWebHistory } from '@ionic/vue-router';
import Tabs from '../views/Tabs.vue'

const routes = [
  {
    path: '/',
    redirect: '/tabs/tutorials'
  },
  {
    path: '/tabs/',
    component: Tabs,
    children: [
      {
        path: '',
        redirect: '/tabs/tutorials'
      },
      {
        path: 'tutorials',
        component: () => import('@/views/Tutorials.vue')
      },
      {
        path: 'statistics',
        component: () => import('@/views/Statistics.vue')
      },
      {
        path: 'about',
        component: () => import('@/views/About.vue')
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
