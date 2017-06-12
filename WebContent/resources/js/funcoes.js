/**
 * 
 */

function validarSenha(input) {
	if (input.value !== document.getElementById("senha").value) {
		input.setCustomValidity('As senhas não são iguais!');
	}
}
