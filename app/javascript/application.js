// Dependencies
import { RalixApp } from 'ralix'
import "@hotwired/turbo-rails"
import "trix"
import "@rails/actiontext"

// Controllers
import AppCtrl      from './controllers/app'
import RegistrationsController from './controllers/registrations_controller'

// Components
import RemoteModal  from './components/remote_modal'
import Tooltip      from './components/tooltip'

const App = new RalixApp({
  routes: {
    '/users/sign_up': RegistrationsController,
    '/.*': AppCtrl,
  },
  components: [
    RemoteModal,
    Tooltip
  ]
})

App.start()
