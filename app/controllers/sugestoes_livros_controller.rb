class SugestoesLivrosController < ApplicationController
  def index
	# 1 - Concreto Armado
	# 2 - Estruturas Metálicas
	# 3 - Fundações
	# 4 - Alvenaria Estrutural
	# 5 - Outros
	
	
	@arquivo_dir = Rails.root.join('app', 'assets', 'sugestoesLivros.csv');
	
	@livrosConcreto = Array.new
	@livrosEstruturasMetalicas = Array.new
	@livrosFundacoes = Array.new
	@livrosAlvenariaEstrutural = Array.new
	@livrosOutros = Array.new
	
	@tipo = 0
	
	File.open(@arquivo_dir, 'r') do |f1|
		while line = f1.gets
			logger.debug line
			@lista = line.split(';')
			
			@valores = Array.new 
			
			@tipo = @lista[0]
			
			@lista.each do |item|
				@valores.push(item)
			end
			
			if (@tipo == "1")
				@livrosConcreto.push(@valores)
			elsif (@tipo == "2")
				@livrosEstruturasMetalicas.push(@valores)
			elsif (@tipo == "3")
				@livrosFundacoes.push(@valores)
			elsif (@tipo == "4")
				@livrosAlvenariaEstrutural.push(@valores)
			else 
				@livrosOutros.push(@valores)
			end
		end
	end
	
  end
end
