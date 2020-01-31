import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    ##
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ## En cada línea elige la tercera columna y luego le asigna un 1 para el posterior conteo
    for line in sys.stdin:
        key = line.split('  ')[0]
        sys.stdout.write("{}\t1\n".format(key))
