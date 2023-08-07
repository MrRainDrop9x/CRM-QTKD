import { createRouter, createWebHistory } from 'vue-router'

import FormAdd from '../components/pages/FormAdd.vue'
import MainPage from '../components/pages/MainPage.vue'
import LeadDetails from '@/components/pages/LeadDetails.vue'
import HomeVue from '@/components/pages/Home.vue'
import EditForm from '@/components/pages/EditForm.vue'

const routes = [
  { path: '/', component: HomeVue },
  { path: '/crm/lead/list', component: MainPage },
  { path: '/crm/lead/add', component: FormAdd },
  {
    path: '/lead/view/:id',
    component: LeadDetails,
  },
  {
    path: '/lead/edit/:id',
    component: EditForm,
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
