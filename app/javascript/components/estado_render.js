const funcion = () => {
  const element = document.getElementById("cambiarEstado");
  element.classList.toggle("none")
  if (document.querySelector('.cambiar').text == "Cambiar estado") {
    document.querySelector('.cambiar').text = "Cancelar"
  }
  else {
    document.querySelector('.cambiar').text = "Cambiar estado"
  }
}

const estadoRender = () => {
  if (document.getElementById("cambiarEstado") != null) {
  document.querySelector('.cambiar').addEventListener("click", funcion)
  }
};

export { estadoRender };
