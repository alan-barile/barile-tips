class ConcretoTabelaTelasController < ApplicationController
  def index
	@arquivo_dir = Rails.root.join('app', 'assets', 'tabela_telas.csv');
	
	#logger.debug @path
	
	@cabecalho = ['No', 'Designação', 'Espaçamento entre Fios', 'Diâmetro (mm)', 'Seções (mm²)', 'Dimensões (cm)', 'Peso kg/m', 'Peso kg/peça']
	
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
