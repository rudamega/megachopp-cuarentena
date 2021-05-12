
  const confirmado = (map) => {
    let latLng = [];
    fetch(`https://megachopp1.herokuapp.com/api/v1/cart_confirmado`)
    .then(response => response.json())
    .then((data) => {
      const lista = data;
      console.log("Confirmado funcionando")
      lista.forEach((list) => {
        if (list['latitud'] != null && list['longitud'] != null ) {
          const id = (list['id'])
          const lati = Number(list['latitud'])
          const longi = Number(list['longitud'])
          const cliente = list['cliente']
          const razon = list['razon_social']
          const link = list['lugar']
          const date = list['date']
          latLng.push([{lat: lati, lng: longi}, "blue", cliente, link, razon, date, id ]);
        };
      });

      let markers = latLng.map(function(location) {
        let marker =  new google.maps.Marker({
          position: location[0],
          map: map,
          icon: {
            url: `http://maps.google.com/mapfiles/ms/icons/${location[1]}-dot.png`
          }
         })

        let contentString =`<h6>Fecha de entrega: ${location[5]}</h6>`+
        `<h6>Cliente: ${location[2]}</h6>`+
         `<h6>Ruc: ${location[4]}</h6>`+
         `<a href="${location[3]} "target="_blank">` +
         "Ir a la Ubi</a>" +
         "<br>" +
         "<br>" +
         `<a https://megachopp1.herokuapp.com/cart_mostrar/${location[6]} "target="_blank">` +
         "Ver pedido</a>";

        const infowindow = new google.maps.InfoWindow({
          content: contentString
        });

        marker.addListener("click", () => {
          infowindow.open(map, marker);
        });
      });
    });
  };

  const entregado = (map) => {
    let latLng1 = [];
    fetch(`https://megachopp1.herokuapp.com/api/v1/cart_entregado`)
    .then(response => response.json())
    .then((data) => {
      const lista = data;
      console.log("Entregado funcionando")
      lista.forEach((list) => {
        if (list['latitud'] != null && list['longitud'] != null ) {
          const id = (list['id'])
          const lati = Number(list['latitud'])
          const longi = Number(list['longitud'])
          const cliente = list['cliente']
          const razon = list['razon_social']
          const link = list['lugar']
          const date = list['date']
          latLng1.push([{lat: lati, lng: longi}, "green", cliente, link, razon, date, id])
          // addMarker({lat: lati, lng: longi}, "green");

        };
      });

      let markers = latLng1.map(function(location) {
        let marker =  new google.maps.Marker({
          position: location[0],
          map: map,
          icon: {
            url: `http://maps.google.com/mapfiles/ms/icons/${location[1]}-dot.png`
          }
         })

        let contentString =`<h6>Fecha de entrega: ${location[5]}</h6>`+
        `<h6>Cliente: ${location[2]}</h6>`+
         `<h6>Ruc: ${location[4]}</h6>`+
         `<a href="${location[3]} "target="_blank">` +
         "Ir a la Ubi</a>" +
         `<a https://megachopp1.herokuapp.com/cart_mostrar/${location[6]} "target="_blank">` +
         "<br>" +
         "<br>" +
         "Ver pedido</a>";

        const infowindow = new google.maps.InfoWindow({
          content: contentString
        });

        marker.addListener("click", () => {
          infowindow.open(map, marker);
        });
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
