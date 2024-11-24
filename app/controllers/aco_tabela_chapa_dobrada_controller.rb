class AcoTabelaChapaDobradaController < ApplicationController
  def index
	#logger.debug @path
	
	@tipoPerfil = params["tipoPerfil"]
	
	logger.debug @tipoPerfil
	
	if(@tipoPerfil == "1")
		@arquivo_dir = Rails.root.join('app', 'assets', 'tabela_chapaDobrada_cantoneira.csv');
		@cabecalho = ['No', 'Descrição', 'bf@pol.', 'tf@pol.', 'Peso@kg/m', 'bf@mm', 'tf@mm', 'Área@cm2']
		@numTotal = 7
	elsif(@tipoPerfil == "2")
		@cabecalho = ['No', 'Descrição', 'h@mm', 'B@mm', 'e@mm', 'Peso@kg/m', 'Área@cm2']
		@arquivo_dir = Rails.root.join('app', 'assets', 'tabela_chapaDobrada_Usimples.csv');
		@numTotal = 6
	else 
		@cabecalho = ['No', 'Descrição', 'h@mm', 'B@mm', 'd@mm', 'e@mm', 'Peso@kg/m', 'Área@cm2']
		@arquivo_dir = Rails.root.join('app', 'assets', 'tabela_chapaDobrada_Uenrijecido.csv');
		@numTotal = 7
	end
	
	@tabela_telas = Array.new
	
	@num = 1
	
	File.open(@arquivo_dir, 'r') do |f1|
		while line = f1.gets
			#logger.debug line
			@lista = line.split(';')
			
			@valores = Array.new 
			@valores.push(@num)
			
			@lista.each do |item|
				@valores.push(item)
			end
			
			@tabela_telas.push(@valores)
			
			@num = @num+1
		end
	end
  end
end
