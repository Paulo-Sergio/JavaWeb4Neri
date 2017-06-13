<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Forum Gamification</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="padding-top: 20px;">

	<div class="container">
		<div class="row">

			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Entre com as informações de login</h3>
					</div>
					
					<div class="panel-body">
						<form action="LogarServlet" method="POST">
							<fieldset>
								<div class="form-group">
									<input type="text" name="usuario" required placeholder="Usuário" class="form-control">
								</div>
								<div class="form-group">
									<input type="password" name="senha" required class="form-control" placeholder="Senha">
								</div>

								<input class="btn btn-lg btn-primary btn-block" type="submit" value="Login"> 
								<a class="btn btn-lg btn-default btn-block" href="cadastro">Cadastre-se</a>

								<tag:statusUsuarioSenha/>
							</fieldset>
						</form>
					</div>
					
				</div>
			</div>

		</div>
	</div>

</body>
</html>