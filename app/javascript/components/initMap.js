
  const confirmado = (map) => {
    let latLng = [];
    fetch(`http://megachopp.com.py/api/v1/cart_confirmado`)
    .then(response => response.json())
    .then((data) => {
      const lista = data;
      lista.forEach((list) => {
        if (list['latitud'] != null && list['longitud'] != null ) {
          const lati = Number(list['latitud'])
          const longi = Number(list['longitud'])
          latLng.push([{lat: lati, lng: longi}, "blue"])
          let markers = latLng.map(function(location) {
            console.log(latLng)
            console.log(location)
            return new google.maps.Marker({
                  position: location[0],
                  map: map,
                  icon: {
                    url: `http://maps.google.com/mapfiles/ms/icons/${location[1]}-dot.png`
                  }
            })
          });
        };
      });
    });

  }

  const entregado = (map) => {
    let latLng1 = [];
    fetch(`http://localhost:3000/api/v1/cart_entregado`)
    .then(response => response.json())
    .then((data) => {
      const lista = data;
      lista.forEach((list) => {
        if (list['latitud'] != null && list['longitud'] != null ) {
          const lati = Number(list['latitud'])
          const longi = Number(list['longitud'])
          latLng1.push([{lat: lati, lng: longi}, "green"])
           let markers1 = latLng1.map(function(location1) {
            console.log(latLng1)
            console.log(location1)
            return new google.maps.Marker({
                  position: location1[0],
                  map: map,
                  icon: {
                    url: `http://maps.google.com/mapfiles/ms/icons/${location1[1]}-dot.png`
                  }
            })
          });
          // addMarker({lat: lati, lng: longi}, "green");
        };
      });
    });
  }


const initMap = () => {


  // The location of Uluru
  if (document.getElementById('map') != null) {
    console.log("Mapa funcionando")

    let map = new google.maps.Map(
      document.getElementById('map'), {
        zoom: 12,
        center: {lat: -25.334310, lng: -57.531904}
      });

    entregado(map);
    confirmado(map);
    // let markers = ubi.map(function(location) {
    //   return new google.maps.Marker({
    //         position: location,
    //         label: 'prueba',
    //         map: map,
    //         icon: {
    //           url: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"
    //         }
    //   })
    // });
  document.querySelector('.miUbicacion').addEventListener("click", () => {
      navigator.geolocation.getCurrentPosition((data) => {
        console.log(data["coords"]["latitude"]);
        console.log(data["coords"]["longitude"]);
        const longitude = data["coords"]["latitude"];
        const latitude = data["coords"]["longitude"];
        let marker = new google.maps.Marker(
          {
            position: {lat: latitude, lng: longitude},
            map: map
          }
          );

      });
    });
  }
}


export { initMap };


// fetch(`http://megachopp.com.py/api/v1/ubicacions/${id}`)
//   .then(response => response.json())
//   .then((data) => {
//     // lugar == link para google maps
//     const lugar = document.getElementById('lugar');
//     const latitud = document.getElementById('latitud');
//     const longitud = document.getElementById('longitud');
//     // const zona = document.getElementById('zona');
//     const obs = document.getElementById('obs');
//     lugar.value = data['ciudad']
//     latitud.value = data['latitud']
//     longitud.value = data['longitud']
//     obs.value = data['obs']
//     // zona.value = data['zona']
//     console.log(data);
//   });
