@echo off
color 0a
mode 70,30

:nome
set /p nome=Digite seu nome: 
goto:inicio

:inicio
cls
echo --------------------
echo.
echo Bem vindo ao JO-KEN-PO
echo --------------------
echo.
echo [1] Pedra
echo [2] Papel
echo [3] Tesoura
echo [4] Lagarto
echo [5] Spock
echo [6] Regras
echo [7] Sair
set /p op=selecione uma opcao: 


	if %op% == 1 ( set mao=pedra 
		goto:jogo )
	if %op% == 2 ( set mao=papel
		goto:jogo)
	if %op% == 3 ( set mao=tesoura
		goto:jogo)
	if %op% == 4 ( set mao=lagarto
		goto:jogo) 
	if %op% == 5 ( set mao=spock 
		goto:jogo) 
	if %op% == 6 (goto:regras) 
	if %op% == 7 (goto:sair) else (
		echo Opcao Invalida!
		pause
		goto inicio
	)
	
	:jogo
		echo.
		echo %nome% escolheu: %mao%
		set /a numero=(%Random% %% 7) + 1
		
		if %numero% == 1 ( set pc=pedra )
		if %numero% == 2 ( set pc=papel )
		if %numero% == 3 ( set pc=tesoura )
		if %numero% == 4 ( set pc=lagarto )
		if %numero% == 5 ( set pc=spock )
		echo Maquina escolheu: %pc%
		
		if %op% == %numero% (goto:empate)
		if %op% == 1 (
			if %numero% == 3 (goto:voce)
			if %numero% == 4 (goto:voce) else (
				goto:maquina )
		) 
		if %op% == 2 (
			if %numero% == 1 (goto:voce)
			if %numero% == 5 (goto:voce) else (
				goto:maquina )
		) 
		if %op% == 3 (
			if %numero% == 2 (goto:voce)
			if %numero% == 4 (goto:voce) else (
				goto:maquina )
		) 
		if %op% == 4 (
			if %numero% == 2 (goto:voce)
			if %numero% == 5 (goto:voce) else (
				goto:maquina )
		) 
		if %op% == 5 (
			if %numero% == 1 (goto:voce)
			if %numero% == 3 (goto:voce) else (
				goto:maquina )
		) 
		
		pause
		goto inicio
		
	:voce 
		set /a vitorias=%vitorias% + 1
		echo.
		echo %nome% venceu!
		echo.
		goto:placar
		pause
		goto inicio
		
	:maquina
		set /a derrotas=%derrotas% + 1
		echo.
		echo A maquina venceu!
		echo.
		goto:placar
		pause
		goto inicio
	
	:empate
		set /a empates=%empates% + 1
		echo.
		echo OPS... Empate!
		echo.
		goto:placar
		pause
		goto inicio
		
	:placar
		echo.
		echo ----- PLACAR DO JOGO -----
		echo.
		echo Vitorias: %vitorias%
		echo Derrotas: %derrotas%
		echo Empates: %empates%
		pause
		goto inicio
	
	:regras
		echo Pedra: 
		echo	   Empata com pedra. Ganha de Tesoura e Lagarto. Perde para Papel e Spock;
		echo.
		echo Papel:
		echo	   Empata com papel. Ganha de Pedra e Spock. Perde para tesoura e Lagarto;
		echo.
		echo Tesoura:
		echo	   Empata com Tesoura. Ganha de Papel e Lagarto. Perde para Pedra e Spock;
		echo.
		echo Lagarto:
		echo	   Empata com Lagarto. Ganha de Papel e Spock. Perde para Pedra e Tesoura;
		echo.
		echo Spock:
		echo	   Empata com Spock. Ganha de Pedra e Tesoura. Perde para Papel e Lagarto.
		pause
		goto inicio
		
	:sair
		exit
		
		
		
		
		
		