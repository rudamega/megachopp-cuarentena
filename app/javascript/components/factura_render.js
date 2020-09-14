const funcion = () => {
  const element = document.getElementById("FactuNueva");
  element.classList.toggle("none")
  if (document.querySelector('.factura').text == "Facturar") {
    document.querySelector('.factura').text = "Cancelar"
  }
  else {
    document.querySelector('.factura').text = "Facturar"
  }
}

const facturaRender = () => {
  if (document.getElementById("FactuNueva") != null) {
  document.querySelector('.factura').addEventListener("click", funcion)
  }
};

export { facturaRender };
