import { createApp } from 'vue'
import App from './App.vue'
import router from './routers'
import store from '@/store'
import mitt from 'mitt'
const emitter = mitt()
const app = createApp(App)
app.config.globalProperties.emitter = emitter
app.use(store)
app.use(router)
app.mount('#app')
