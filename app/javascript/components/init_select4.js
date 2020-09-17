
const initSelect4 = () => {
  if (document.getElementById("select4") != null) {
  document.getElementById("select4").addEventListener("change", select4)
  console.log('select4 probando')
  }
};

export { initSelect4 };

const select4 = () => {
    const confirmado = document.querySelectorAll('.confirmado');
    const entregado = document.querySelectorAll('.entregado');
    const retirado = document.querySelectorAll('.retirado');
    const soloBarril = document.querySelectorAll('.solo-barril');
    const maquina = document.querySelectorAll('.Maquina');
    const anulado = document.querySelectorAll('.anulado');
    console.log(document.getElementById("select4").value)
  if (document.getElementById("select4").value == "todos") {
    if (confirmado[0]) {
        let i;
          for (i = 0; i < confirmado.length; i++) {
            confirmado[i].classList.remove("no-mostrar")
          }
        }
        if (retirado[0]) {
          let i;
            for (i = 0; i < retirado.length; i++) {
              retirado[i].classList.remove("no-mostrar")
            }
        }
        if (entregado[0]) {
          let i;
            for (i = 0; i < entregado.length; i++) {
              entregado[i].classList.remove("no-mostrar")
            }
        }
        if (soloBarril[0]) {
          let i;
            for (i = 0; i < soloBarril.length; i++) {
              soloBarril[i].classList.remove("no-mostrar")
            }
        }
        if (maquina[0]) {
          let i;
            for (i = 0; i < maquina.length; i++) {
              maquina[i].classList.remove("no-mostrar")
            }
        }
        if (anulado[0]) {
          let i;
            for (i = 0; i < anulado.length; i++) {
              anulado[i].classList.remove("no-mostrar")
            }
        }

    console.log('todos')
  }

  if (document.getElementById("select4").value == "Confirmados") {
    if (confirmado[0]) {
    let i;
      for (i = 0; i < confirmado.length; i++) {
        confirmado[i].classList.remove("no-mostrar")
      }
    }
    if (retirado[0]) {
      let i;
        for (i = 0; i < retirado.length; i++) {
          retirado[i].classList.add("no-mostrar")
        }
    }
    if (entregado[0]) {
      let i;
        for (i = 0; i < entregado.length; i++) {
          entregado[i].classList.add("no-mostrar")
        }
    }
    if (soloBarril[0]) {
      let i;
        for (i = 0; i < soloBarril.length; i++) {
          soloBarril[i].classList.add("no-mostrar")
        }
    }
    if (maquina[0]) {
      let i;
        for (i = 0; i < maquina.length; i++) {
          maquina[i].classList.add("no-mostrar")
        }
    }
    if (anulado[0]) {
      let i;
        for (i = 0; i < anulado.length; i++) {
          anulado[i].classList.add("no-mostrar")
        }
    }
    console.log('confirmado')
  }


  if (document.getElementById("select4").value == "Entregados") {
    if (confirmado[0]) {
      let i;
       for (i = 0; i < confirmado.length; i++) {
        confirmado[i].classList.add("no-mostrar")
      }
    }
    if (retirado[0]) {
      let i;
        for (i = 0; i < retirado.length; i++) {
          retirado[i].classList.add("no-mostrar")
        }
    }
    if (entregado[0]) {
      let i;
        for (i = 0; i < entregado.length; i++) {
          entregado[i].classList.remove("no-mostrar")
        }
    }
    if (soloBarril[0]) {
      let i;
        for (i = 0; i < soloBarril.length; i++) {
          soloBarril[i].classList.add("no-mostrar")
        }
    }
    if (maquina[0]) {
      let i;
        for (i = 0; i < maquina.length; i++) {
          anulado[i].classList.add("no-mostrar")
        }
    }
    if (anulado[0]) {
      let i;
        for (i = 0; i < anulado.length; i++) {
          maquina[i].classList.add("no-mostrar")
        }
    console.log("entregado")
    }
  }



  if (document.getElementById("select4").value == "Retirados") {
    if (confirmado[0]) {
    let i;
      for (i = 0; i < confirmado.length; i++) {
        confirmado[i].classList.add("no-mostrar")
      }
    }
    if (retirado[0]) {
      let i;
        for (i = 0; i < retirado.length; i++) {
          retirado[i].classList.remove("no-mostrar")
        }
    }
    if (entregado[0]) {
      let i;
        for (i = 0; i < entregado.length; i++) {
          entregado[i].classList.add("no-mostrar")
        }
    }
    if (soloBarril[0]) {
      let i;
        for (i = 0; i < soloBarril.length; i++) {
          soloBarril[i].classList.add("no-mostrar")
        }
    }
    if (maquina[0]) {
      let i;
        for (i = 0; i < maquina.length; i++) {
          maquina[i].classList.add("no-mostrar")
        }
    }
    console.log('retirado')
    if (anulado[0]) {
      let i;
        for (i = 0; i < anulado.length; i++) {
          anulado[i].classList.add("no-mostrar")
        }
    }
  }


  if (document.getElementById("select4").value == "Solo Barril") {
    if (confirmado[0]) {
    let i;
      for (i = 0; i < confirmado.length; i++) {
        confirmado[i].classList.add("no-mostrar")
      }
    }
    if (retirado[0]) {
      let i;
        for (i = 0; i < retirado.length; i++) {
          retirado[i].classList.add("no-mostrar")
        }
    }
    if (entregado[0]) {
      let i;
        for (i = 0; i < entregado.length; i++) {
          entregado[i].classList.add("no-mostrar")
        }
    }
    if (soloBarril[0]) {
      let i;
        for (i = 0; i < soloBarril.length; i++) {
          soloBarril[i].classList.remove("no-mostrar")
        }
    }
    if (maquina[0]) {
      let i;
        for (i = 0; i < maquina.length; i++) {
          maquina[i].classList.add("no-mostrar")
        }
    }
    console.log('solo-barril')
    if (anulado[0]) {
      let i;
        for (i = 0; i < anulado.length; i++) {
          anulado[i].classList.add("no-mostrar")
        }
    }
  }

  if (document.getElementById("select4").value == "Maquina fija") {
    if (confirmado[0]) {
    let i;
      for (i = 0; i < confirmado.length; i++) {
        confirmado[i].classList.add("no-mostrar")
      }
    }
    if (retirado[0]) {
      let i;
        for (i = 0; i < retirado.length; i++) {
          retirado[i].classList.add("no-mostrar")
        }
    }
    if (entregado[0]) {
      let i;
        for (i = 0; i < entregado.length; i++) {
          entregado[i].classList.add("no-mostrar")
        }
    }
    if (soloBarril[0]) {
      let i;
        for (i = 0; i < soloBarril.length; i++) {
          soloBarril[i].classList.add("no-mostrar")
        }
    }
    if (maquina[0]) {
      let i;
        for (i = 0; i < maquina.length; i++) {
          maquina[i].classList.remove("no-mostrar")
        }
    }
    if (anulado[0]) {
      let i;
        for (i = 0; i < anulado.length; i++) {
          anulado[i].classList.add("no-mostrar")
        }
    }
    console.log('maquina')
  }
}
