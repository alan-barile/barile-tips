function retornaCoeficienteReacaoHorizontal(rbSoloSeco, rbSoloSubmerso, soloTipo)
{
	// 1 - Areia fofa
	// 2 - Areia medianamente compacta
	// 3 - Areia compacta
	// 4 - Silte muito fofo
	// 5 - Argila muito mole
	
	const listaSoloSeco = [ 2.6, 8, 20, 0.1, 0.55];
	const listaSoloSubmerso = [ 1.5, 5, 12.5, 0.1, 0.55];

	if(rbSoloSeco == 1)
		return listaSoloSeco[soloTipo-1];
	else 
		return listaSoloSubmerso[soloTipo-1];
}

function retornaPesoEspecificoNatural(indice)
{
    const listaPesosEspecificosNatural = [16, 16, 17, 18, 18, 13, 15, 17, 19, 21];

    return listaPesosEspecificosNatural[indice-1];
}

function retornaPesoEspecificoSaturado(indice)
{
	const listaPesosEspecificosSaturado = [19, 19, 20, 21, 21, 13, 15, 17, 19, 21];

    return listaPesosEspecificosSaturado[indice-1];
}

function retornaCoesao(indice, Nspt)
{  
    if (indice <= 5)
        c = 0;
    else
        c = 10 * Nspt;
    
    
    if (indice < 3)
        c = (2 / 3) * c;
    else if (indice >= 6 && indice <= 7)
        c = (2 / 3) * c;
    else
        c = 1 * c;
    
    
    return c;
}

function retornaAnguloAtrito(indice, Nspt)
{
    ctePi = Math.PI;
    
    if (indice > 5)
        angulo = 0;
    else
        angulo = 28 + (0.4 * Nspt);
    
    tanNova = Math.tan(angulo * ctePi / 180);
    
    if (indice < 3)
        tanNova = (2 / 3) * Math.tan(angulo * ctePi / 180);
    
    if (indice >= 6 && indice <= 7)
        tanNova = (2 / 3) * Math.tan(angulo * ctePi / 180);
    
    
    angulo = Math.atan(tanNova);
	angulo = angulo * 180 / ctePi;
    
    return angulo;
}

function retornaFatorCargaNq(angulo)
{
	ctePi = Math.PI;
    
    Nq = Math.exp(ctePi * Math.tan(angulo * ctePi / 180)) * (Math.tan((45 * ctePi / 180) + ((angulo * ctePi / 180) / 2)) ** 2);
    
    return Nq;
}

function retornaFatorCargaNc(angulo)
{
   ctePi = Math.PI;
    
    Nq = retornaFatorCargaNq(angulo)
    
    if (angulo == 0)
        Nc = 5.14;
    else
        Nc = (1 / Math.tan(angulo * ctePi / 180)) * (Nq - 1);
    
    return Nc;
}

function retornaFatorCargaNq(angulo)
{
    ctePi = Math.PI;
    
    Nq = Math.exp(ctePi * Math.tan(angulo * ctePi / 180)) * (Math.tan((45 * ctePi / 180) + ((angulo * ctePi / 180) / 2)) ** 2);
    
    return Nq;
}

function retornaFatorCargaNy(angulo)
{
     ctePi = Math.PI;
     
     Nq = retornaFatorCargaNq(angulo);
      
     Ny = 2 * (Nq + 1) * Math.tan(angulo * ctePi / 180)
     
     return Ny;
}     


function retornaFatorFormaSc(razao, angulo)
{
    
    Nq = retornaFatorCargaNq(angulo);
    Nc = retornaFatorCargaNc(angulo);
    
    if (razao == 1)
        Sc = 1 + (Nq / Nc);
    else
        Sc = 1 + (razao * (Nq / Nc));
    
    return Sc;
}

function retornaFatorFormaSq(razao, angulo)
{
    ctePi = Math.PI;
     
    if (razao == 1)
        retornaFatorCargaSq = 1 + Math.tan(angulo * ctePi / 180);
    else
		retornaFatorCargaSq = 1 + (razao * Math.tan(angulo * ctePi / 180));
    
    return retornaFatorCargaSq;
}

function retornaFatorFormaSy(razao)
{
    if (razao == 1)
         return 0.6;
    else
        return (1 - (0.4 * razao));
}

function retornaSobrecarga(indice, h_anterior, h,H_agua)
{
    pesoNatural = retornaPesoEspecificoNatural(indice);
    pesoSaturado = retornaPesoEspecificoSaturado(indice);
    
    h_temp = h - h_anterior;
    
    if (h <= H_agua) 
        q = pesoNatural * h_temp;
    else if (H_agua > h_anterior && H_agua < h)
        q = (pesoNatural * (H_agua - h_anterior)) + ((pesoSaturado - 10) * (h - H_agua));
    else
        q = (pesoSaturado - 10) * h_temp;
    
	return q;
}

function retornaPesoEspecificoMedio(indice, h, H_agua, h_Bulbo)
{
    
    pesoNatural = retornaPesoEspecificoNatural(indice);
    pesoSaturado = retornaPesoEspecificoSaturado(indice);
    
    if (H_agua <= h) 
        y = (pesoSaturado - 10);
    else 
	{
        if (H_agua < h_Bulbo)
		{
            y1 = ((H_agua - h) * pesoNatural);
            y2 = ((h_Bulbo - H_agua) * (pesoSaturado - 10));
            y = (y1 + y2) / (h_Bulbo - h);
		}
        else
            y = pesoNatural;
    }    
    
    
    return y;
}

function retornaBulboTensoes(B, L)
{
    if (B == L)
        hB = 2 * B;
    else
        hB = 3 * B;
    
    return hB;
}

function retornaLargura(B, L)
{
    if (B <= L)
        return B;
    else
        return L;
}

function retornaTensaoAdmissivelIPT(indice, Nspt)
{
	const listaNSPTInferior = [0, 4, 10, 30, 50, 0, 2, 4, 8, 15];
	const listaTensaoInferior = [0, 1, 2, 4, 5, 0, 0.5, 1.5, 3, 4];
	
	const listaNSPTSuperior = [4, 10, 30, 50, 60, 2, 4, 8, 15, 30]
	const listaTensaoSuperior = [1, 2, 3, 5, 6, 0.5, 1.5, 3, 4, 5];
	
	x1 = listaNSPTInferior[indice-1];
	y1 = listaTensaoInferior[indice-1];

	x2 = listaNSPTSuperior[indice-1];
	y2 = listaTensaoSuperior[indice-1];
	
	r = ((Nspt - x1) * ((y2 - y1) / (x2 - x1))) + y1

	return r;
}

function retornaCoeficienteEmpuxoAtivo(angulo)
{
	phi = 45 - (angulo/2);
    
	Ka = Math.tan(angulo * ctePi / 180);
	
	Ka = Ka**2

    return Ka;
}

function retornaTensaoVertical(h, y)
{
	sV = h*y;
	
	return sV;
}

function retornaTensaoHorizontal(Ka, sV)
{
	sH = Ka*sV;
	
	return sH;
}

function retornaEmpuxoTriangular(sH, h)
{
	E=sH*h/2;
	
	return E;
}

function momentoEmpuxoEngasteLivre(E, h)
{
	M=E*(h/3);
	
	return M;
}