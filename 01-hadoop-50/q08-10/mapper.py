import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__=="__main__":
	for linea in sys.stdin:
		key=linea.split("   ")[0]
		val=linea.split("   ")[2]
		val=float(val)

		sys.stdout.write("{}\t{}\n".format(key,val))
