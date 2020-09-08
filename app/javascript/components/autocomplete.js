
const autocomplete = () => {
if (document.getElementById('select2')) {
const id = document.getElementById('select2').value;
if (id != "") {
fetch(`http://www.megachopp.com.py/api/v1/users/${id}`)
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
    cliente.value = data['first_name']
    cliente.razon_social = data['razon_social']
    ruc.value = data['ruc']
    email.value = data['email']
    tel.value = data['phone_number']
    lugar.value = data['lugar']
    latitud.value = data['latitud']
    longitud.value = data['longitud']
    console.log(data);
  });
};
};


}


export { autocomplete };
