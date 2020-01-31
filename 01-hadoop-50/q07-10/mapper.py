import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__=="__main__":
	for linea in sys.stdin:
		key=linea.split("   ")[0]
		fec=linea.split("   ")[1]
		val=int(linea.split("   ")[2])
		val=str(val)
		val=val.zfill(3)
		llave=key+val
		sys.stdout.write("{}\t{}\t{}\t{}\n".format(llave,key,fec,val))
