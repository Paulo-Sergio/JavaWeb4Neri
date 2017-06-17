<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<c:import url="WEB-INF/partial/cabecalho.jsp" />
<%-- <tags:verificaSessao /> --%>

<div class="row">
	<div class="col-md-12">
		<c:choose>
			<c:when test="${param.acao eq 'novo'}">
				<h1 class="page-header">Novo Cliente</h1>
			</c:when>
			<c:otherwise>
				<h1 class="page-header">Editar Cliente</h1>
			</c:otherwise>
		</c:choose>
	</div>

	<form method="POST" action="ClienteServlet?acao=${param.acao}">

		<div class="col-md-6">
			<c:if test="${param.acao eq 'alterar'}">
				<input type="hidden" readonly="readonly" name="id" class="form-control" id="id" value="${cliente.getId()}">
			</c:if>
			<div class="form-group">
				<label for="nome">Nome</label> 
				<input type="text" name="nome" class="form-control" id="nome" value="${cliente.getNome()}">
			</div>
			<div class="form-group">
				<label for="idBairro">Bairro</label> 
				<input type="text" name="idBairro" class="form-control" id="idBairro" value="${cliente.getIdBairro()}">
			</div>
			<div class="form-group">
				<label for="idLogradouro">Logradouro</label> 
				<input type="text" name="idLogradouro" class="form-control" id="idLogradouro" value="${cliente.getIdLogradouro()}">
			</div>
			<div class="form-group">
				<label for="numero">Número</label> 
				<input type="text" name="numero" class="form-control" id="numero" value="${cliente.getNumero()}">
			</div>
			<div class="form-group">
				<label for="idCidade">Cidade</label> 
				<input type="text" name="idCidade" class="form-control" id="idCidade" value="${cliente.getIdCidade()}">
			</div>
			<div class="form-group">
				<label for="complemento">Complemento</label> 
				<input type="text" name="complemento" class="form-control" id="complemento" placeholder="casa ou apto (nº)" value="${cliente.getComplemento()}">
			</div>
			<div class="form-group">
				<label for="cep">CEP</label> 
				<input type="text" name="cep" class="form-control" id="cep" pattern="[0-9]{5}-[0-9]{3}" placeholder="11111-000" onkeypress="formata_mascara(this, '#####-###'); return Numero(event)" value="${cliente.getCep()}">
			</div>
			<div class="form-group">
				<label for="rg">RG</label> 
				<input type="text" name="rg" class="form-control" id="rg" value="${cliente.getRg()}">
			</div>
			<div class="form-group">
				<label for="cpf">CPF</label> 
				<input type="text" name="cpf" class="form-control" id="cpf" onkeypress="formata_mascara(this, '###.###.###-##'); return Numero(event)" placeholder="123.456.789-01" value="${cliente.getCpf()}">
			</div>
			<div class="form-group">
				<label for="dataNascimento">Data de Nascimento</label> 
				<input type="text" name="dataNascimento" class="form-control" id="dataNascimento" placeholder="dd/mm/aaaa" onkeypress="formata_mascara(this, '##/##/####'); return Numero(event)" value="<fmt:formatDate value='${cliente.getDataNascimento()}' pattern='dd/MM/yyyy' type='date' />">
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="form-group">
				<label for="dataCadastro">Data de Cadastro</label> 
				<input type="text" name="dataCadastro" class="form-control" id="dataCadastro" placeholder="dd/mm/aaaa" onkeypress="formata_mascara(this, '##/##/####'); return Numero(event)" value="<fmt:formatDate value='${cliente.getDataCadastro()}' pattern='dd/MM/yyyy' type='date' />">
			</div>
			<div class="form-group">
				<label for="fonecel">Celular</label> 
				<input type="text" name="fonecel" class="form-control" pattern="\([0-9]{2}\)[0-9]{5}-[0-9]{4}" placeholder="(81)91234-1234" id="fonecel" value="${cliente.getFonecel()}">
			</div>
			<div class="form-group">
				<label for="fone2">Residencial / Comercial</label> 
				<input type="text" name="fone2" class="form-control" pattern="\([0-9]{2}\)[0-9]{4}-[0-9]{4}" placeholder="(81)1234-1234" id="fone2" value="${cliente.getFone2()}">
			</div>
			<div class="form-group">
				<label for="email">E-mail</label> 
				<input type="text" name="email" class="form-control" id="email" placeholder="email@dominio.com" value="${cliente.getEmail()}">
			</div>
			<div class="form-group">
				<label>Sexo:</label> 
				<label class="radio-inline">
					<input type="radio" name="sexo" id="sexo" value="M" ${cliente.getSexo() == 'M' ? 'checked=checked' : ''}> Masculino
				</label>
				<label class="radio-inline">
					<input type="radio" name="sexo" id="sexo" value="F" ${cliente.getSexo() == 'F' ? 'checked=checked' : ''}> Feminino
				</label>
			</div>
			<div class="form-group">
				<label for="obs">Observações</label> 
				<textarea class="form-control" name="obs">${cliente.getObs()}</textarea>
			</div>
			<div class="form-group">
				<label for="foto">Foto</label>
				<input type="file" name="foto" class="form-control" id="foto" value="${cliente.getFoto()}">
				<img src="resources/imagens/fotoclientes/koala.jpg" class="img-responsive img-thumbnail" alt="Foto" width="200">
			</div>
		</div>
		
		<div class="col-md-12">
			<div class="form-group">
				<a href="ClienteServlet" class="btn btn-default">Voltar</a>
				<button type="submit" class="btn btn-primary">Salvar Cliente</button>
			</div>
		</div>
	</form>
</div>

<c:import url="WEB-INF/partial/rodape.jsp" />