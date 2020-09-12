const list = (data) => {
  console.log("hola probando");
  const lista = data['ubicacions']
  const lugar = document.querySelector("#select3");
  const sel = document.getElementById('select3');
  let i = 0;
    for (i = sel.length - 1; i >= 0; i--) {
      sel.remove(i);
    };
  lista.forEach((list) => {
    console.log(list);
    lugar.insertAdjacentHTML("beforeend", `<option value=\"0\"> Elegir -- Ubicacion } </option>`);
    lugar.insertAdjacentHTML("beforeend", `<option value=\"${list['id']}\"> ${ list['name'] } -- ${ list['ciudad'] } </option>`);
  });
};


const autocomplete = () => {
if (document.getElementById('select2')) {
const id = document.getElementById('select2').value;
if (id != "") {
fetch(`http://localhost:3000/api/v1/clientes/${id}`)
  .then(response => response.json())
  .then((data) => {
    const cliente = document.getElementById('cliente');
    const razon_social = document.getElementById('razon_social');
    const ruc = document.getElementById('ruc');
    const email = document.getElementById('email');
    const tel = document.getElementById('tel');
    const lugar = document.getElementById('lugar');
    const latitud = document.getElementById('latitud');
    const longitud = document.getElementById('longitud');
    cliente.value = data['name']
    razon_social.value = data['razon_social']
    ruc.value = data['ruc']
    email.value = data['email']
    tel.value = data['tel']
    console.log(data);
    list(data);
  });
};
};

}


export { autocomplete };
