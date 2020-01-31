import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__=="__main__":
	for linea in sys.stdin:
		key=linea.split("   ")[0]
		fec=linea.split("   ")[1]
		val=linea.split("   ")[2]

		val=int(val)
		val=str(val)
		val=val.zfill(3)
		sys.stdout.write("{}\t{}\t{}\t{}\n".format(val,key,fec,int(val)))