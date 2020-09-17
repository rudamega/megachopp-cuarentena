const select4 = () => {
    const confirmado = document.querySelector('.confirmado');
    const entregado = document.querySelector('.entregado');
    const retirado = document.querySelector('.retirado');
    const soloBarril = document.querySelector('.solo-barril');
    const maquina = document.querySelector('.Maquina');
    console.log(document.getElementById("select4").value)
  if (document.getElementById("select4").value == "todos") {
    if (confirmado) {
          confirmado.classList.remove("no-mostrar")
        }
        if (retirado) {
          retirado.classList.remove("no-mostrar")
        }
        if (entregado) {
          entregado.classList.remove("no-mostrar")
        }
        if (soloBarril) {
          soloBarril.classList.remove("no-mostrar")
        }
        if (maquina) {
          maquina.classList.remove("no-mostrar")
        }
    console.log('todos')

  }
  if (document.getElementById("select4").value == "Confirmados") {
    if (confirmado) {
      confirmado.classList.remove("no-mostrar")
    }
    if (retirado) {
      retirado.classList.add("no-mostrar")
    }
    if (entregado) {
      entregado.classList.add("no-mostrar")
    }
    if (soloBarril) {
      soloBarril.classList.add("no-mostrar")
    }
    if (maquina) {
      maquina.classList.add("no-mostrar")
    }
    console.log('confirmado')

  }
  if (document.getElementById("select4").value == "Entregados") {
    if (entregado) {
      entregado.classList.remove("no-mostrar")
    }
    if (confirmado) {
      confirmado.classList.add("no-mostrar")
    }
    if (retirado) {
      retirado.classList.add("no-mostrar")
    }
    if (soloBarril) {
      soloBarril.classList.add("no-mostrar")
    }
    if (maquina) {
      maquina.classList.add("no-mostrar")
    }
    console.log("entregado")
  }
  if (document.getElementById("select4").value == "Retirados") {
    if (retirado) {
      retirado.classList.remove("no-mostrar")
    }
    if (entregado) {
      entregado.classList.add("no-mostrar")
    }
    if (confirmado) {
      confirmado.classList.add("no-mostrar")
    }
    if (soloBarril) {
      soloBarril.classList.add("no-mostrar")
    }
    if (maquina) {
      maquina.classList.add("no-mostrar")
    }
    console.log('retirado')

  }
  if (document.getElementById("select4").value == "Solo Barril") {
    if (soloBarril) {
      soloBarril.classList.remove("no-mostrar")
    }
    if (retirado) {
      retirado.classList.add("no-mostrar")
    }
    if (entregado) {
      entregado.classList.add("no-mostrar")
    }
    if (confirmado) {
      confirmado.classList.add("no-mostrar")
    }
    if (maquina) {
      maquina.classList.add("no-mostrar")
    }
    console.log('solo-barril')

  }
  if (document.getElementById("select4").value == "Maquina fija") {
    if (maquina) {
      maquina.classList.remove("no-mostrar")
    }
    if (soloBarril) {
      soloBarril.classList.add("no-mostrar")
    }
    if (retirado) {
      retirado.classList.add("no-mostrar")
    }
    if (entregado) {
      entregado.classList.add("no-mostrar")
    }
    if (confirmado) {
      confirmado.classList.add("no-mostrar")
    }
    console.log('maquina')
  }
}

const initSelect4 = () => {
  if (document.getElementById("select4") != null) {
  document.getElementById("select4").addEventListener("change", select4)
  console.log('select4 probando')
  }
};

export { initSelect4 };
