class AcoTabelaPerfilLaminadoController < ApplicationController
  def index
	@arquivo_dir = Rails.root.join('app', 'assets', 'tabela_perfil_laminado.csv');
	
	#logger.debug @path
	
	@tabela_perfil_laminado = Array.new
	
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
			
			@tabela_perfil_laminado.push(@valores)
			
			@num = @num+1
		end
	end
  end
end
