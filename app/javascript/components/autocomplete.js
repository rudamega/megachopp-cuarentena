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
fetch(`https://megachopp1.herokuapp.com/api/v1/clientes/${id}`)
  .then(response => response.json())
  .then((data) => {
    const cliente = document.getElementById('cliente');
    const cliente2 = document.getElementById('cliente2');
    const cliente_id = document.getElementById('cliente_id');
    const razon_social = document.getElementById('razon_social');
    const ruc = document.getElementById('ruc');
    const email = document.getElementById('email');
    const tel = document.getElementById('tel');
    const tel2 = document.getElementById('tel2');
    const lugar = document.getElementById('lugar');
    const latitud = document.getElementById('latitud');
    const longitud = document.getElementById('longitud');
    cliente_id.value = id
    cliente2.value = data['name2']
    cliente.value = data['name']
    razon_social.value = data['razon_social']
    ruc.value = data['ruc']
    email.value = data['email']
    tel.value = data['tel']
    tel2.value = data['tel2']
    console.log(data);
    list(data);
  });
};
};

}


export { autocomplete };
