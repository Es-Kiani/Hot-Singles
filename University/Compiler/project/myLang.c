#include <stdio.h>
#include <stdbool.h>


extern int yylex();
extern char* yyin;



int main(int argc, char **argv)
{

    FILE *fp;
    char filename[1024];

    printf("Enter the filename: \n");
    scanf("%s", filename);

    fp = fopen(filename, "r");
    yyin = fp;
  
    yylex();
    
    return 0;
}
