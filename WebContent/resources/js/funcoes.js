/**
 * 
 */

function validarSenha(input) {
	if (input.value !== document.getElementById("senha").value) {
		input.setCustomValidity('As senhas não são iguais!');
	} else {
		input.setCustomValidity('');
	}
}

// funcoes para criar mascara nos campos
function formata_mascara(obj, mascara) {
	var campo = obj.value.length;
	var saida = mascara.substring(0, 1);
	var texto = mascara.substring(campo);
	if (texto.substring(0, 1) != saida) {
		obj.value += texto.substring(0, 1);
	}
}

function Numero(e) {
	navegador = /msie/i.test(navigator.userAgent);
	var tecla;
	if (navegador)
		tecla = event.keyCode;
	else
		tecla = e.which;

	if (tecla > 47 && tecla < 58) {// numero de 0 a 9
		return true;
	} else {
		if (tecla != 8) // backspace
			return false;
		else
			return true;
	}
}

function atualizarFoto() {
	var fotoDigitada = document.getElementById("foto").value;
	document.getElementById("mostraFoto").src = "resources/imagens/fotoclientes/"+fotoDigitada;
}