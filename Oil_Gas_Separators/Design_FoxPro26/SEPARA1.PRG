set score off
set safety off
set readborder on
set talk off
define wind ventana1 from 2,1 to 30,90 system title'Diseno de Separadores' minimi close float in desktop
sw='s'
activate wind ventana1
move wind ventana1 center
do while sw='s' or sw='S'
	clear
	opci=0
	if lastkey()=27
		deac wind all
		cancel
	endif
	@1,2 say '1.Separador Vertical'
	@2,2 say '2.Separador Horizontal'
	@3,2 say 'Tipo de separador para el diseno?' get opci valid (opci=1 .or. opci=2)
	read
	if opci=1
		opci1=0
		@1,48 say'1.Fabricante NATCO-PEERLES'
		@2,48 say'2.Fabricante EPRCO'
		@3,48 say'3.Fabricante EXXON'
		@4,48 say'4.Ninguna de las anteriores...'
		@5,48 say'Opcion a seleccionar:' get opci1 
		read
			if opci1=1	
				opci2=0
				@7,1,9,80 box
				@8,2 say'1.Normativa GPSA'
				@8,23 say'2.Normativa PDVSA'
				@8,45 say'Normativa a utilizar:' get opci2 valid (opci2=1 .or. opci2=2)
				read
				if opci2=1	
				wait window'Normativa GPSA empresa NATCO-PEERLES' timeout(3)
					dl=0
					dg=0
					fmg=0
					fml=0
					po=0
					tope=0
					z=0
					dt=0
					@11,1,20,80 box
					@11,30 say 'Datos del Problema' color w+/r
					@12,2 say'Diametro de la tuberia de entrada y salida al separador pulg:' get dt pict'999.999'
					@13,2 say'Densidad Liquida en lb/pc:' 
					@13,37 get dl pict '999.999'
					@14,2 say'Densidad del Gas en lb/pc ( A CN):'
					@14,37 get dg pict '999.999'
					@15,2 say'Flujo masico de gas lbs/seg:' 
					@15,37 get fmg pict'99999.9999'
					@16,2 say'Flujo masico de liquido en lbs/seg:'
					@16,37 get fml pict '99999.9999'
					@17,2 say'Presion de operacion en psi:'
					@17,37 get po pict '99999.9999'
					@18,2 say'Temperatura de operacion Grado F:'
					@18,37 get tope pict '999.9999'
					@19,2 say'Factor de Compresibilidad del gas:' 
					@19,37 get z pict '9.9999'
					read
					vg=0
					vg=0.16*(((dl-dg)/dg)^0.5)
					qg=0
					qg=(fmg/dg)
					qo=0
					qo=qg*(14.7/(po+14.7))*((tope+460)/520)*z
					area=0
					area=(qg/vg)
					di=0
					di=(((4*area)/3.1416)^0.5)
					api=0
					api=(141.5/(dl/62.4))-131.5
					trl=0
					if api>40
						trl=1.5
					endif
					if api<=40 .and. api>=25
						trl=3
					endif
					if api<25 
						trl=5
					endif
					vl=0
					vl=60*trl*(fml/dl)
					l=0
					l=vl/area
					lt=(di/4)+l+1+1+(2*dt)+di+0.5+(di/4)+(((di-dt)/2)-(di/4))
					@21,1,25,45 box
					@21,17 say'Resultados' color w+/b+
					@22,2 say'Diametro interno:' 
					@22,25 get di
					@23,2 say'Longitud del separador:' 
					@23,25 get lt
					clear gets
					endif
				if opci2=2
					wait window'Normativa PDVSA Empresa NATCO-PEERLES'	
					dl=0
					dg=0
					fmg=0
					fml=0
					po=0
					tope=0
					z=0
					dt=0
					@12,2 say'Diametro de la tuberia de entrada y salida al separador pulg:' get dt pict'999.999'
					@13,2 say'Densidad Liquida en lb/pc:' get dl pict '999.999'
					@14,2 say'Densidad del Gas en lb/pc ( A CN):' get dg pict '999.999'
					@15,2 say'Flujo masico de gas lbs/seg:' get fmg pict'99999.9999'
					@16,2 say'Flujo masico de liquido en lbs/seg:' get fml pict '99999.9999'
					@17,2 say'Presion de operacion en psi:' get po pict '99999.9999'
					@18,2 say'Temperatura de operacion Grado F:' get tope pict '999.9999'
					@19,2 say'Factor de Compresibilidad del gas:' get z pict '9.9999'
					read
					vg=0
					vg=0.16*(((dl-dg)/dg)^0.5)
					qg=0
					qg=(fmg/dg)
					qo=0
					qo=qg*(14.7/(po+14.7))*((tope+460)/520)*z
					area=0
					area=(qg/vg)
					di=0
					di=(((4*area)/3.1416)^0.5)
					api=0
					api=(141.5/(dl/62.4))-131.5
					trl=0
					if api>40
						trl=1.5
					endif
					if api<=40 .and. api>=25
						trl=3
					endif
					if api<25 
						trl=5
					endif
					vl=0
					vl=60*trl*(fml/dl)
					l=0
					l=vl/area
					lt=(di/4)+l+(0.3*di)+(dt)+(0.60*di)+0.5+(di/4)+(((di-dt)/2)-(di/4))
					@22,2 say'Diametro interno:' get di
					@23,2 say'Longitud del separador:' get lt
					clear gets
				endif
			endif
			if opci1=2	
				opci2=0
				@9,2 say'1.Normativa GPSA'
				@10,2 say'2.Normativa PDVSA'
				@11,2 say'Normativa a utilizar:' get opci2 valid (opci2=1 .or. opci2=2)
				read
				if opci2=1	
				wait window'Normativa GPSA empresa EPRCO' time(3)
					dl=0
					dg=0
					fmg=0
					fml=0
					po=0
					tope=0
					z=0
					dt=0
					@12,2 say'Diametro de la tuberia de entrada y salida al separador pulg:' get dt pict'999.999'
					@13,2 say'Densidad Liquida en lb/pc:' get dl pict '999.999'
					@14,2 say'Densidad del Gas en lb/pc ( A CN):' get dg pict '999.999'
					@15,2 say'Flujo masico de gas lbs/seg:' get fmg pict'99999.9999'
					@16,2 say'Flujo masico de liquido en lbs/seg:' get fml pict '99999.9999'
					@17,2 say'Presion de operacion en psi:' get po pict '99999.9999'
					@18,2 say'Temperatura de operacion Grado F:' get tope pict '999.9999'
					@19,2 say'Factor de Compresibilidad del gas:' get z pict '9.9999'
					read
					vg=0
					vg=0.157*(((dl-dg)/dg)^0.5)
					qg=0
					qg=(fmg/dg)
					qo=0
					qo=qg*(14.7/(po+14.7))*((tope+460)/520)*z
					area=0
					area=(qg/vg)
					di=0
					di=(((4*area)/3.1416)^0.5)
					api=0
					api=(141.5/(dl/62.4))-131.5
					trl=0
					if api>40
						trl=1.5
					endif
					if api<=40 .and. api>=25
						trl=3
					endif
					if api<25 
						trl=5
					endif
					vl=0
					vl=60*trl*(fml/dl)
					l=0
					l=vl/area
					lt=(di/4)+l+1+1+(2*dt)+di+0.5+(di/4)+(((di-dt)/2)-(di/4))
					@22,2 say'Diametro interno:' get di
					@23,2 say'Longitud del separador:' get lt
					clear gets
				endif
				if opci2=2
					wait window'Normativa PDVSA empresa EPRCO'time (3)
					dl=0
					dg=0
					fmg=0
					fml=0
					po=0
					tope=0
					z=0
					dt=0
					@12,2 say'Diametro de la tuberia de entrada y salida al separador pulg:' get dt pict'999.999'
					@13,2 say'Densidad Liquida en lb/pc:' get dl pict '999.999'
					@14,2 say'Densidad del Gas en lb/pc ( A CN):' get dg pict '999.999'
					@15,2 say'Flujo masico de gas lbs/seg:' get fmg pict'99999.9999'
					@16,2 say'Flujo masico de liquido en lbs/seg:' get fml pict '99999.9999'
					@17,2 say'Presion de operacion en psi:' get po pict '99999.9999'
					@18,2 say'Temperatura de operacion Grado F:' get tope pict '999.9999'
					@19,2 say'Factor de Compresibilidad del gas:' get z pict '9.9999'
					read
					vg=0
					vg=0.157*(((dl-dg)/dg)^0.5)
					qg=0
					qg=(fmg/dg)
					qo=0
					qo=qg*(14.7/(po+14.7))*((tope+460)/520)*z
					area=0
					area=(qg/vg)
					di=0
					di=(((4*area)/3.1416)^0.5)
					api=0
					api=(141.5/(dl/62.4))-131.5
					trl=0
					if api>40
						trl=1.5
					endif
					if api<=40 .and. api>=25
						trl=3
					endif
					if api<25 
						trl=5
					endif
					vl=0
					vl=60*trl*(fml/dl)
					l=0
					l=vl/area
					lt=(di/4)+l+(0.3*di)+(dt)+(0.60*di)+0.5+(di/4)+(((di-dt)/2)-(di/4))
					@22,2 say'Diametro interno:' get di
					@23,2 say'Longitud del separador:' get lt
					clear gets
				endif
			endif
			if opci1=3
				opci2=0
				@9,2 say'1.Normativa GPSA'
				@10,2 say'2.Normativa PDVSA'
				@11,2 say'Normativa a utilizar:' get opci2 valid (opci2=1 .or. opci2=2)
				read
				if opci2=1	
				wait window'Normativa GPSA empresa EXXON' time (3)
					dl=0
					dg=0
					fmg=0
					fml=0
					po=0
					tope=0
					z=0
					dt=0
					@12,2 say'Diametro de la tuberia de entrada y salida al separador pulg:' get dt pict'999.999'
					@13,2 say'Densidad Liquida en lb/pc:' get dl pict '999.999'
					@14,2 say'Densidad del Gas en lb/pc ( A CN):' get dg pict '999.999'
					@15,2 say'Flujo masico de gas lbs/seg:' get fmg pict'99999.9999'
					@16,2 say'Flujo masico de liquido en lbs/seg:' get fml pict '99999.9999'
					@17,2 say'Presion de operacion en psi:' get po pict '99999.9999'
					@18,2 say'Temperatura de operacion Grado F:' get tope pict '999.9999'
					@19,2 say'Factor de Compresibilidad del gas:' get z pict '9.9999'
					read
					vg=0
					vg=0.167*(((dl-dg)/dg)^0.5)
					qg=0
					qg=(fmg/dg)
					qo=0
					qo=qg*(14.7/(po+14.7))*((tope+460)/520)*z
					area=0
					area=(qg/vg)
					di=0
					di=(((4*area)/3.1416)^0.5)
					api=0
					api=(141.5/(dl/62.4))-131.5
					trl=0
					if api>40
						trl=1.5
					endif
					if api<=40 .and. api>=25
						trl=3
					endif
					if api<25 
						trl=5
					endif
					vl=0
					vl=60*trl*(fml/dl)
					l=0
					l=vl/area
					lt=(di/4)+l+1+1+(2*dt)+di+0.5+(di/4)+(((di-dt)/2)-(di/4))
					@22,2 say'Diametro interno:' get di
					@23,2 say'Longitud del separador:' get lt
					clear gets
				endif
				if opci2=2
					wait window'Normativa PDVSA empresa EXXON'	time (3)
					dl=0
					dg=0
					fmg=0
					fml=0
					po=0
					tope=0
					z=0
					dt=0
					@12,2 say'Diametro de la tuberia de entrada y salida al separador pulg:' get dt pict'999.999'
					@13,2 say'Densidad Liquida en lb/pc:' get dl pict '999.999'
					@14,2 say'Densidad del Gas en lb/pc ( A CN):' get dg pict '999.999'
					@15,2 say'Flujo masico de gas lbs/seg:' get fmg pict'99999.9999'
					@16,2 say'Flujo masico de liquido en lbs/seg:' get fml pict '99999.9999'
					@17,2 say'Presion de operacion en psi:' get po pict '99999.9999'
					@18,2 say'Temperatura de operacion Grado F:' get tope pict '999.9999'
					@19,2 say'Factor de Compresibilidad del gas:' get z pict '9.9999'
					read
					vg=0
					vg=0.167*(((dl-dg)/dg)^0.5)
					qg=0
					qg=(fmg/dg)
					qo=0
					qo=qg*(14.7/(po+14.7))*((tope+460)/520)*z
					area=0
					area=(qg/vg)
					di=0
					di=(((4*area)/3.1416)^0.5)
					api=0
					api=(141.5/(dl/62.4))-131.5
					trl=0
					if api>40
						trl=1.5
					endif
					if api<=40 .and. api>=25
						trl=3
					endif
					if api<25 
						trl=5
					endif
					vl=0
					vl=60*trl*(fml/dl)
					l=0
					l=vl/area
					lt=(di/4)+l+(0.3*di)+(dt)+(0.60*di)+0.5+(di/4)+(((di-dt)/2)-(di/4))
					@22,2 say'Diametro interno:' get di
					@23,2 say'Longitud del separador:' get lt
					clear gets
				endif
			endif
			if opci1=4	
				opci2=0
				@9,2 say'1.Normativa GPSA'
				@10,2 say'2.Normativa PDVSA'
				@11,2 say'Normativa a utilizar:' get opci2 valid (opci2=1 .or. opci2=2)
				read
				if opci2=1
				wait window'Normativa GPSA Diseno Generalizado'	
					dl=0
					dg=0
					fmg=0
					fml=0
					po=0
					tope=0
					z=0
					dt=0
					@12,2 say'Diametro de la tuberia de entrada y salida al separador pulg:' get dt pict'999.999'
					@13,2 say'Densidad Liquida en lb/pc:' get dl pict '999.999'
					@14,2 say'Densidad del Gas en lb/pc ( A CN):' get dg pict '999.999'
					@15,2 say'Flujo masico de gas lbs/seg:' get fmg pict'99999.9999'
					@16,2 say'Flujo masico de liquido en lbs/seg:' get fml pict '99999.9999'
					@17,2 say'Presion de operacion en psi:' get po pict '99999.9999'
					@18,2 say'Temperatura de operacion Grado F:' get tope pict '999.9999'
					@19,2 say'Factor de Compresibilidad del gas:' get z pict '9.9999'
					read
					vg=0
					k=0
					r=0
					r=(fml/fmg)
					if r<0.1
						k=0.35
					endif
					if r>=0.1 .and. r<=1
						k=0.25
					endif
					if r>1
						k=0.20
					endif
					vg=k*(((dl-dg)/dg)^0.5)
					qg=0
					qg=(fmg/dg)
					qo=0
					qo=qg*(14.7/(po+14.7))*((tope+460)/520)*z
					area=0
					area=(qg/vg)
					di=0
					di=(((4*area)/3.1416)^0.5)
					api=0
					api=(141.5/(dl/62.4))-131.5
					trl=0
					if api>40
						trl=1.5
					endif
					if api<=40 .and. api>=25
						trl=3
					endif
					if api<25 
						trl=5
					endif
					vl=0
					vl=60*trl*(fml/dl)
					l=0
					l=vl/area
					lt=(di/4)+l+1+1+(2*dt)+di+0.5+(di/4)+(((di-dt)/2)-(di/4))
					@22,2 say'Diametro interno:' get di
					@23,2 say'Longitud del separador:' get lt
					clear gets
				endif
				if opci2=2
					wait window'Normativa PDVSA Diseno Generalizado' time (3)	
					dl=0
					dg=0
					fmg=0
					fml=0
					po=0
					tope=0
					z=0
					dt=0
					@12,2 say'Diametro de la tuberia de entrada y salida al separador pulg:' get dt pict'999.999'
					@13,2 say'Densidad Liquida en lb/pc:' get dl pict '999.999'
					@14,2 say'Densidad del Gas en lb/pc ( A CN):' get dg pict '999.999'
					@15,2 say'Flujo masico de gas lbs/seg:' get fmg pict'99999.9999'
					@16,2 say'Flujo masico de liquido en lbs/seg:' get fml pict '99999.9999'
					@17,2 say'Presion de operacion en psi:' get po pict '99999.9999'
					@18,2 say'Temperatura de operacion Grado F:' get tope pict '999.9999'
					@19,2 say'Factor de Compresibilidad del gas:' get z pict '9.9999'
					read
					vg=0
					k=0
					r=0
					r=(fml/fmg)
					if r<0.1
						k=0.35
					endif
					if r>=0.1 .and. r<=1
						k=0.25
					endif
					if r>1
						k=0.20
					endif
					vg=k*(((dl-dg)/dg)^0.5)
					qg=0
					qg=(fmg/dg)
					qo=0
					qo=qg*(14.7/(po+14.7))*((tope+460)/520)*z
					area=0
					area=(qg/vg)
					di=0
					di=(((4*area)/3.1416)^0.5)
					api=0
					api=(141.5/(dl/62.4))-131.5
					trl=0
					if api>40
						trl=1.5
					endif
					if api<=40 .and. api>=25
						trl=3
					endif
					if api<25 
						trl=5
					endif
					vl=0
					vl=60*trl*(fml/dl)
					l=0
					l=vl/area
					lt=(di/4)+l+(0.3*di)+(dt)+(0.60*di)+0.5+(di/4)+(((di-dt)/2)-(di/4))
					@22,2 say'Diametro interno:' get di
					@23,2 say'Longitud del separador:' get lt
					clear gets
				endif
			endif
		endif
		if opci=2
		opci1=0
		@0,47,6,80 box
		@1,48 say'1.Fabricante NATCO-PEERLES'
		@2,48 say'2.Fabricante EPRCO'
		@3,48 say'3.Fabricante EXXON'
		@4,48 say'4.Ninguna de las anteriores...'
		@5,48 say'Opcion a seleccionar:' get opci1 
		read
			if opci1=1	
				wait window'Separadores Horizontales, empresa NATCO-PEERLES' timeout(3)
					dl=0
					dg=0
					fmg=0
					fml=0
					po=0
					tope=0
					z=0
					dt=0
					l=0
					de=0
					re=0
					do while re<2.5
					@11,1,20,80 box
					@11,30 say 'Datos del Problema' color w+/r
					@12,2 say'Longitud del Separador estimada(pie):' get l pict'999.9999'
					@13,2 say'Diametro del Separador estimado(pie):' get de pict '999.9999'
					read
					re=(l/de)
					if re<2.5
						wait wind'Valores de L y D no Validos Vuelva a intentarlo......'
						l=0
						de=0						
					endif
					enddo
					@12,2 clear to 15,79
					@13,2 say'Densidad Liquida en lb/pc:' 
					@13,37 get dl pict '999.999'
					@14,2 say'Densidad del Gas en lb/pc ( A CN):'
					@14,37 get dg pict '999.999'
					@15,2 say'Flujo masico de gas lbs/seg:' 
					@15,37 get fmg pict'99999.9999'
					@16,2 say'Flujo masico de liquido en lbs/seg:'
					@16,37 get fml pict '99999.9999'
					@17,2 say'Presion de operacion en psi:'
					@17,37 get po pict '99999.9999'
					@18,2 say'Temperatura de operacion Grado F:'
					@18,37 get tope pict '999.9999'
					@19,2 say'Factor de Compresibilidad del gas:' 
					@19,37 get z pict '9.9999'
					read
					vg=0
					vg=0.16*(((dl-dg)/dg)^0.5)*(l^0.5)
					qg=0
					qg=(fmg/dg)
					qo=0
					qo=qg*(14.7/(po+14.7))*((tope+460)/520)*z
					area=0
					area=(qo/vg)
					di=0
					api=0
					api=(141.5/(dl/62.4))-131.5
					trl=0
					if api>40
						trl=1.5
					endif
					if api<=40 .and. api>=25
						trl=3
					endif
					if api<25 
						trl=5
					endif
					vl=0
					vl=60*trl*(fml/dl)
					areal=0 
					areal=vl/l
					areat=0
					areat=area+areal
					di=((4*areat)/3.1416)^0.5
					@21,1,25,50 box
					@21,17 say'Resultados' color w+/b+
					@22,2 say'Diametro interno:' 
					@22,25 get di
					@23,2 say'Longitud del separador:' 
					@23,25 get l
					clear gets
				endif
				if opci1=2	
				wait window'Separadores Horizontales, empresa EPRCO' timeout(3)
					dl=0
					dg=0
					fmg=0
					fml=0
					po=0
					tope=0
					z=0
					dt=0
					l=0
					re=0
					do while re<2.5
					@11,1,20,80 box
					@11,30 say 'Datos del Problema' color w+/r
					@12,2 say'Longitud del Separador estimada(pie):' get l pict'999.9999'
					read
					re=(l/20)
					if re<2.5
						wait wind'Valores de L y D no Validos Vuelva a intentarlo......'
						l=0
						de=0						
					endif
					enddo
					@12,2 clear to 15,79
					@13,2 say'Densidad Liquida en lb/pc:' 
					@13,37 get dl pict '999.999'
					@14,2 say'Densidad del Gas en lb/pc ( A CN):'
					@14,37 get dg pict '999.999'
					@15,2 say'Flujo masico de gas lbs/seg:' 
					@15,37 get fmg pict'99999.9999'
					@16,2 say'Flujo masico de liquido en lbs/seg:'
					@16,37 get fml pict '99999.9999'
					@17,2 say'Presion de operacion en psi:'
					@17,37 get po pict '99999.9999'
					@18,2 say'Temperatura de operacion Grado F:'
					@18,37 get tope pict '999.9999'
					@19,2 say'Factor de Compresibilidad del gas:' 
					@19,37 get z pict '9.9999'
					read
					vg=0
					vg=0.157*(((dl-dg)/dg)^0.5)*((l/20)^0.5)
					qg=0
					qg=(fmg/dg)
					qo=0
					qo=qg*(14.7/(po+14.7))*((tope+460)/520)*z
					area=0
					area=(qo/vg)
					di=0
					api=0
					api=(141.5/(dl/62.4))-131.5
					trl=0
					if api>40
						trl=1.5
					endif
					if api<=40 .and. api>=25
						trl=3
					endif
					if api<25 
						trl=5
					endif
					vl=0
					vl=60*trl*(fml/dl)
					areal=0 
					areal=vl/l
					areat=0
					areat=area+areal
					di=((4*areat)/3.1416)^0.5
					@21,1,25,55 box
					@21,17 say'Resultados' color w+/b+
					@22,2 say'Diametro interno:' 
					@22,25 get di
					@23,2 say'Longitud del separador:' 
					@23,25 get l
					clear gets
					endif
				if opci1=3	
				wait window'Separadores Horizontales, empresa EXXON' timeout(3)
					dl=0
					dg=0
					fmg=0
					fml=0
					po=0
					tope=0
					z=0
					dt=0
					l=0
					re=0
					do while re<2.5
					@11,1,20,80 box
					@11,30 say 'Datos del Problema' color w+/r
					@12,2 say'Longitud del Separador estimada(pie):' get l pict'999.9999'
					read
					re=(l/20)
					if re<2.5
						wait wind'Valores de L y D no Validos Vuelva a intentarlo......'
						l=0
						de=0						
					endif
					enddo
					@12,2 clear to 15,79
					@13,2 say'Densidad Liquida en lb/pc:' 
					@13,37 get dl pict '999.999'
					@14,2 say'Densidad del Gas en lb/pc ( A CN):'
					@14,37 get dg pict '999.999'
					@15,2 say'Flujo masico de gas lbs/seg:' 
					@15,37 get fmg pict'99999.9999'
					@16,2 say'Flujo masico de liquido en lbs/seg:'
					@16,37 get fml pict '99999.9999'
					@17,2 say'Presion de operacion en psi:'
					@17,37 get po pict '99999.9999'
					@18,2 say'Temperatura de operacion Grado F:'
					@18,37 get tope pict '999.9999'
					@19,2 say'Factor de Compresibilidad del gas:' 
					@19,37 get z pict '9.9999'
					read
					vg=0
					vg=0.4*(((dl-dg)/dg)^0.5)*((l/20)^0.5)
					qg=0
					qg=(fmg/dg)
					qo=0
					qo=qg*(14.7/(po+14.7))*((tope+460)/520)*z
					area=0
					area=(qo/vg)
					di=0
					api=0
					api=(141.5/(dl/62.4))-131.5
					trl=0
					if api>40
						trl=1.5
					endif
					if api<=40 .and. api>=25
						trl=3
					endif
					if api<25 
						trl=5
					endif
					vl=0
					vl=60*trl*(fml/dl)
					areal=0 
					areal=vl/l
					areat=0
					areat=area+areal
					di=((4*areat)/3.1416)^0.5
					@21,1,25,55 box
					@21,17 say'Resultados' color w+/b+
					@22,2 say'Diametro interno:' 
					@22,25 get di
					@23,2 say'Longitud del separador:' 
					@23,25 get l
					clear gets
					endif
				if opci1=4	
				wait window'Separadores Horizontales, Diseño Generalizado' timeout(3)
					dl=0
					dg=0
					fmg=0
					fml=0
					po=0
					tope=0
					z=0
					dt=0
					l=0
					de=0
					re=0
					do while re<2.5
					@11,1,20,80 box
					@11,30 say 'Datos del Problema' color w+/r
					@12,2 say'Longitud del Separador estimada(pie):' get l pict'999.9999'
					@13,2 say'Diametro del Separador estimado(pie):' get de pict '999.9999'
					read
					re=(l/de)
					if re<2.5
						wait wind'Valores de L y D no Validos Vuelva a intentarlo......'
						l=0
						de=0						
					endif
					enddo
					if re>=2.5 .and. re<=4
						k=0.4
					endif
					if re>4 .and. re<=6
						k=0.5
					endif
					if re>6 
						lbase=0
						lbase=6*de
						k=0.50*((l/lbase)^0.050)
					endif
					@12,2 clear to 15,79
					@13,2 say'Densidad Liquida en lb/pc:' 
					@13,37 get dl pict '999.999'
					@14,2 say'Densidad del Gas en lb/pc ( A CN):'
					@14,37 get dg pict '999.999'
					@15,2 say'Flujo masico de gas lbs/seg:' 
					@15,37 get fmg pict'99999.9999'
					@16,2 say'Flujo masico de liquido en lbs/seg:'
					@16,37 get fml pict '99999.9999'
					@17,2 say'Presion de operacion en psi:'
					@17,37 get po pict '99999.9999'
					@18,2 say'Temperatura de operacion Grado F:'
					@18,37 get tope pict '999.9999'
					@19,2 say'Factor de Compresibilidad del gas:' 
					@19,37 get z pict '9.9999'
					read
					vg=0
					vg=k*(((dl-dg)/dg)^0.5)*(l^0.5)
					qg=0
					qg=(fmg/dg)
					qo=0
					qo=qg*(14.7/(po+14.7))*((tope+460)/520)*z
					area=0
					area=(qo/vg)
					di=0
					api=0
					api=(141.5/(dl/62.4))-131.5
					trl=0
					if api>40
						trl=1.5
					endif
					if api<=40 .and. api>=25
						trl=3
					endif
					if api<25 
						trl=5
					endif
					vl=0
					vl=60*trl*(fml/dl)
					areal=0 
					areal=vl/l
					areat=0
					areat=area+areal
					di=((4*areat)/3.1416)^0.5
					@21,1,25,50 box
					@21,17 say'Resultados' color w+/b+
					@22,2 say'Diametro interno:' 
					@22,25 get di
					@23,2 say'Longitud del separador:' 
					@23,25 get l
					clear gets
				endif
				endif
		@25,2 say'Disenar otro?' get sw
	read
enddo
deac wind all
					
					
					
		
	