import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    total = 0
    cont=0
    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:
    	if cont<6:
	        text,key,fec,val = line.split("\t")
	        val = int(val)
	        sys.stdout.write("{}\t{}\t{}\n".format(key, fec,val))
	        cont+=1

    #sys.stdout.write("{},{}\n".format(curkey, total))
