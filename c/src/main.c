#include "version.h"
#include <stdio.h>
#include <stdlib.h>

int
main ( int argc, char *argv[] )
{
    printf( "Hello World .\n" );
    printf( "version: ");
    printf( _VERSION );
    printf( ". \n");
    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
