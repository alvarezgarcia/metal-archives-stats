#!/usr/bin/Rscript

library("jsonlite")

print("CARGANDO")
json_data = fromJSON("/tmp/metal_db.json")

paises = as.data.frame(table(json_data$pais))
paises_ord = paises[order(paises$Freq),]

#print(tail(paises_ord, n = 10L))

f = function(cada) {
				p= cada[1]
				f= cada[2]
				cat(p, '=', f, '\n')


				data_pais = subset(json_data, json_data$pais == p)
				genero_por_pais = as.data.frame(table(data_pais$genero))
				genero_por_pais_ord = genero_por_pais[order(genero_por_pais$Freq),]

				g = tail(genero_por_pais_ord, 1)
				#cat(g, '\n')
				print(g)

}


#invisible(apply(paises_ord, 1, function(c) map_print(c[1], json_data)))
r = apply(paises_ord, 1, f)
