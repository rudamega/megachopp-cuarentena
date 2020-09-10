
const funcion = () => {
  const element = document.getElementById("ubiNueva");
  const boton =  document.getElementById("ubiNueva");
  element.classList.toggle("none")
  if (document.querySelector('.agregar').text == "Agregar Ubi") {
    document.querySelector('.agregar').text = "Cancelar"
    document.querySelector('.agregar').classList.add('agregarColor')
  }
  else {
    document.querySelector('.agregar').text = "Agregar Ubi"
    document.querySelector('.agregar').classList.remove('agregarColor')
  }
}

const ubicacionRender = () => {
  if (document.getElementById("ubiNueva") != null) {
  document.querySelector('.agregar').addEventListener("click", funcion)
  }
};

export { ubicacionRender };
