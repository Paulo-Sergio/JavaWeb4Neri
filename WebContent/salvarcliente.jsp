<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<c:import url="WEB-INF/partial/cabecalho.jsp" />
<%-- <tags:verificaSessao /> --%>

<c:choose>
	<c:when test="${param.acao eq 'novo'}">
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header">Cadastro de Novo Cliente</h1>
			</div>
	
			<form method="POST" action="ClienteServlet?acao=novo">
	
				<div class="col-md-6">
					<div class="form-group">
						<label for="nome">Nome</label> 
						<input type="text" name="nome" class="form-control" id="nome">
					</div>
					<div class="form-group">
						<label for="idBairro">Bairro</label> 
						<input type="text" name="idBairro" class="form-control" id="idBairro">
					</div>
					<div class="form-group">
						<label for="idLogradouro">Logradouro</label> 
						<input type="text" name="idLogradouro" class="form-control" id="idLogradouro">
					</div>
					<div class="form-group">
						<label for="numero">Número</label> 
						<input type="text" name="numero" class="form-control" id="numero">
					</div>
					<div class="form-group">
						<label for="idCidade">Cidade</label> 
						<input type="text" name="idCidade" class="form-control" id="idCidade">
					</div>
					<div class="form-group">
						<label for="complemento">Complemento</label> 
						<input type="text" name="complemento" class="form-control" id="complemento">
					</div>
					<div class="form-group">
						<label for="cep">CEP</label> 
						<input type="text" name="cep" class="form-control" id="cep">
					</div>
					<div class="form-group">
						<label for="rg">RG</label> 
						<input type="text" name="rg" class="form-control" id="rg">
					</div>
					<div class="form-group">
						<label for="cpf">CPF</label> 
						<input type="text" name="cpf" class="form-control" id="cpf">
					</div>
				</div>
				
				<div class="col-md-6">
					<div class="form-group">
						<label for="dataNascimento">Data de Nascimento</label> 
						<input type="date" name="dataNascimento" class="form-control" id="dataNascimento">
					</div>
					<div class="form-group">
						<label for="dataCadastro">Data de Cadastro</label> 
						<input type="date" name="dataCadastro" class="form-control" id="dataCadastro">
					</div>
					<div class="form-group">
						<label for="fonecel">Celular</label> 
						<input type="text" name="fonecel" class="form-control" id="fonecel">
					</div>
					<div class="form-group">
						<label for="fone2">Residencial / Comercial</label> 
						<input type="text" name="fone2" class="form-control" id="fone2">
					</div>
					<div class="form-group">
						<label for="email">E-mail</label> 
						<input type="text" name="email" class="form-control" id="email">
					</div>
					<div class="form-group">
						<label for="foto">Foto</label> 
						<input type="text" name="foto" class="form-control" id="foto">
					</div>
					<div class="form-group">
						<label for="sexo">Sexo</label> 
						<input type="text" name="sexo" class="form-control" id="sexo">
					</div>
					<div class="form-group">
						<label for="obs">Observações</label> 
						<textarea class="form-control" name="obs"></textarea>
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
	</c:when>

	<c:otherwise>
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header">Editar Cliente</h1>
			</div>
	
			<form method="POST" action="ClienteServlet?acao=alterar">
	
				<div class="col-md-6">
					<div class="form-group">
						<label for="id">Código</label> 
						<input type="text" readonly="readonly" name="id" class="form-control" id="id" value="${cliente.getId()}">
					</div>
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
						<input type="text" name="complemento" class="form-control" id="complemento" value="${cliente.getComplemento()}">
					</div>
					<div class="form-group">
						<label for="cep">CEP</label> 
						<input type="text" name="cep" class="form-control" id="cep" value="${cliente.getCep()}">
					</div>
					<div class="form-group">
						<label for="rg">RG</label> 
						<input type="text" name="rg" class="form-control" id="rg" value="${cliente.getRg()}">
					</div>
				</div>
				
				<div class="col-md-6">
					<div class="form-group">
						<label for="cpf">CPF</label> 
						<input type="text" name="cpf" class="form-control" id="cpf" value="${cliente.getCpf()}">
					</div>
					<div class="form-group">
						<label for="dataNascimento">Data de Nascimento</label> 
						<input type="date" name="dataNascimento" class="form-control" id="dataNascimento" value="${cliente.getDataNascimento()}">
					</div>
					<div class="form-group">
						<label for="dataCadastro">Data de Cadastro</label> 
						<input type="date" name="dataCadastro" class="form-control" id="dataCadastro" value="${cliente.getDataCadastro()}">
					</div>
					<div class="form-group">
						<label for="fonecel">Celular</label> 
						<input type="text" name="fonecel" class="form-control" id="fonecel" value="${cliente.getFonecel()}">
					</div>
					<div class="form-group">
						<label for="fone2">Residencial / Comercial</label> 
						<input type="text" name="fone2" class="form-control" id="fone2" value="${cliente.getFone2()}">
					</div>
					<div class="form-group">
						<label for="email">E-mail</label> 
						<input type="text" name="email" class="form-control" id="email" value="${cliente.getEmail()}">
					</div>
					<div class="form-group">
						<label for="foto">Foto</label> 
						<input type="text" name="foto" class="form-control" id="foto" value="${cliente.getFoto()}">
					</div>
					<div class="form-group">
						<label for="sexo">Sexo</label> 
						<input type="text" name="sexo" class="form-control" id="sexo" value="${cliente.getSexo()}">
					</div>
					<div class="form-group">
						<label for="obs">Observações</label> 
						<textarea class="form-control" name="obs">${cliente.getObs()}</textarea>
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
	</c:otherwise>
</c:choose>

<c:import url="WEB-INF/partial/rodape.jsp" />