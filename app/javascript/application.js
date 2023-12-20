// Dependencies
import { RalixApp } from 'ralix'
// import Rails        from '@rails/ujs'
// import Turbolinks   from 'turbolinks'
import "@hotwired/turbo-rails"
import "trix"
import "@rails/actiontext"

// Controllers
import AppCtrl      from './controllers/app'
import ArticlesCtrl from './controllers/articles'
import RegistrationsController from './controllers/registrations_controller'
import ImagePreviewController from './image_preview_controller';

// Components
import RemoteModal  from './components/remote_modal'
import Tooltip      from './components/tooltip'

const App = new RalixApp({
  routes: {
    '/articles$': ArticlesCtrl,
    '/users/sign_up': RegistrationsController,
    '/.*': AppCtrl,
  },
  components: [
    RemoteModal,
    Tooltip
  ]
})

// Rails.start()
// Turbo.start()
App.start()
