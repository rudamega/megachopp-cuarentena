import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css'
import { autocomplete } from 'components/autocomplete';

const select2 = () => {
  autocomplete();
}

const initSelect2 = () => {
  $('#select2').select2({
    language: "es",
    width: '100%',
    placeholder: 'Selectcione un cliente',
     });
     console.log('init_select2')
  $('#select2').on('select2:select', select2);

};

export { initSelect2 };
