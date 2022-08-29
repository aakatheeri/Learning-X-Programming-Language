import { createRouter, createWebHistory } from 'vue-router'
import Home from '../components/pages/Home.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/about',
      name: 'about',
      component: () => import('../components/pages/About.vue')
     },
     {
      path: '/contact',
      name: 'contact',
      component: () => import('../components/pages/Contact.vue')
     }
  ]
})

export default router
