import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == '__main__':

    curkey = None
    suma1 = 0
    x=0
    prom=0

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key, val = line.split("\t")
        val=float(val)
        

        if key == curkey:
            suma1 = suma1 + val
            x += 1
            prom = suma1 / x

        else:
            if curkey is None:
            	curkey = key
            	suma1 = val
            	x = 1
            	prom = suma1 / x
            else:
	            sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma1,prom))
	            curkey = key
	            suma1 = val
	            x = 1
	            prom = suma1 / x

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma1,prom))
