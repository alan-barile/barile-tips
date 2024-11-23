class ConcretoTaxaArmacaoController < ApplicationController
  def index
	@cabecalho = ['D (mm)', 'A (m²)', '5', '7,5', '10', '12,5', '15', '17,5', '20']
	
	@espacamentos = [5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0]
	@barras_aco = [5.0, 6.3, 8.0, 10.0, 12.5, 16.0, 20.0, 25.0]
	
	@taxas = Array.new
	
	@barras_aco.each do |barra|
		@lista = Array.new
		
		diam = barra
		area = (3.14*(diam/10)**2)/4
		
		@lista.push(diam)
		@lista.push(format('%.2f', area))
		
		@espacamentos.each do |s|
			taxa = area*100/s
			@lista.push(format('%.2f', taxa))
		end
		
		@taxas.push(@lista)
	end
  end
end
