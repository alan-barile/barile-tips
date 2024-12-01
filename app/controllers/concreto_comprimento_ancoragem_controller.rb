class ConcretoComprimentoAncoragemController < ApplicationController
  def index
	@concreto = [15.0, 20.0, 25.0, 30.0, 35.0, 40.0]
	
	@barras_aco = [5.0, 6.3, 8.0, 10.0, 12.5, 16.0, 20.0, 25.0]
	
	@comprimentosAncoragem = Array.new
	
	@num = 1
	
	@fyd = 500.0/1.15 # Aço CA-50
	@n1 = 2.25 		# Barras nervuradas
	@n3 = 1.0		# Diâmetro < 32mm
	
	@barras_aco.each do |barra|
		@lista = Array.new
		
		@diam = barra
		
		@lista.push(@num)
		@lista.push(@diam)
		
		@concreto.each do |fck|
			
			@fctd = 0.21*(fck**(2.0/3.0))/1.4
			
			@fbd = @n1*1*@n3*@fctd
			
			#logger.debug @fbd
			
			@c = ((@diam/10.0)/4.0)*@fyd
			
			@lb = @c/@fbd
			@lbMA = @lb/0.7
			
			@lista.push(@lbMA.round)
			@lista.push(@lb.round)
		end
		
		@comprimentosAncoragem.push(@lista)
		
		@num = @num + 1
	end
  end
end
