import { autocomplete1 } from 'components/autocomplete1';


const select3 = () => {
  console.log('select3 probando')
  autocomplete1();
}

const initSelect3 = () => {
  if (document.getElementById("select3") != null) {
  document.getElementById("select3").addEventListener("change", select3)
  console.log('select3 probando')
  }
};

export { initSelect3 };
