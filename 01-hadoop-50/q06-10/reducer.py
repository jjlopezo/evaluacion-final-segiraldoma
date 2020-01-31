import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    maximo = 0
    minimo = 999

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key, val = line.split("\t")
        val=float(val)

        if key == curkey:
            minimo=min(minimo,val)
            maximo=max(maximo,val)
            
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, maximo,minimo))
            else:
            	minimo=min(minimo,val)
            	maximo=max(maximo,val)

            curkey = key
            minimo = val
            maximo = val
            

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, maximo,minimo))

