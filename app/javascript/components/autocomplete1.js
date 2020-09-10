
const autocomplete1 = () => {
if (document.getElementById('select3')) {
const id = document.getElementById('select3').value;
if (id != "") {
fetch(`http://megachopp.com.py/api/v1/ubicacions/${id}`)
  .then(response => response.json())
  .then((data) => {
    // lugar == link para google maps
    const lugar = document.getElementById('lugar');
    const latitud = document.getElementById('latitud');
    const longitud = document.getElementById('longitud');
    // const zona = document.getElementById('zona');
    const obs = document.getElementById('obs');
    lugar.value = data['ciudad']
    latitud.value = data['latitud']
    longitud.value = data['longitud']
    obs.value = data['obs']
    // zona.value = data['zona']
    console.log(data);
  });
};
};

}


export { autocomplete1 };
