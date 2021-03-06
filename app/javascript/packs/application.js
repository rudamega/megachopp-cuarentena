// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import { toolTips } from 'components/tooltips'
import { previewImageOnFileSelect } from '../components/photo_preview';

import flatpickr from "flatpickr"
import { Spanish } from "flatpickr/dist/l10n/es.js"
require('flatpickr/dist/flatpickr.css')

import { initSelect2 } from 'components/init_select2';
import { initSelect3 } from 'components/init_select3';
import { initSelect4 } from 'components/init_select4';
import { initMap } from 'components/initMap';
import { ubicacionRender } from 'components/ubicacion_render';
import { estadoRender } from 'components/estado_render';
import { facturaRender } from 'components/factura_render';

// [...]



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  toolTips();
  previewImageOnFileSelect();
  initSelect2();
  initSelect3();
  initSelect4();
  initMap();
  estadoRender();
  facturaRender();
  ubicacionRender();
  flatpickr("#fecha",
    {
      "locale": Spanish,
      "altInput": true,
       "altFormat": "l -- j - F, Y",
      // "dateFormat": "d-m-y",
    });
});
