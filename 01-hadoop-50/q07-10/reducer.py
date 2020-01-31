import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<

if __name__ == '__main__':
   

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        concat,key,date,val= line.split("\t")
        val=int(val)

        sys.stdout.write("{}   {}   {}\n".format(key,date ,val))
            