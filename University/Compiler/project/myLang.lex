%{
#include "myLang.h"
#include <stdio.h>
#include <stdbool.h>

int yyerror(char *errMsg, int line, bool nl);
size_t findIndex(const char *arr[], const char *val);

int line = 1;
%}



NEWLINE           [\n]
WHITESPACE        [ \t]
EOF               <EOF>|"eof"|"end"
COMMENT           "~!".*"\n"
PARENTHESIS       "("|")"|"["|"]"|"{"|"}"
INCLUDE           "#include"[ ]*"<"{INCLUDENAME}">"
INCLUDENAME       [_a-zA-Z0-9\.\-]+
IDENTIFIRE        ("_"[_a-zA-Z0-9]+)|([a-zA-Z][_a-zA-Z0-9]*)
INT               0|([0]?[1-9][0-9]*)
FLOAT             [0-9]*\.[0-9]+
DIGITSING         "+"|"-" 
SIGNEDINT         {DIGITSING}{INT}
SIGNEDFLOAT       {DIGITSING}{FLOAT}
STRING            (\".*\")|(\"(\\.|[^"\\])*\")
VARINC            {IDENTIFIRE}"++"
VARDEC            {IDENTIFIRE}"--"
DATATYPE          "int"|"float"|"char"|"str"
UNS               "using namespace"[ ]+{IDENTIFIRE}



%% 
{WHITESPACE}      {/* NOP */}
{NEWLINE}         { line++ ;}
{EOF}             {printf("\nThe End Of File.\n"); return 0;}
{COMMENT}         {printf("#TOKEN: %d# | #TYPE: COMMENT#\n", findIndex(TOKENS, "comment"));}

"auto"            {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#              ->      < ", findIndex(TOKENS, yytext));         ECHO; printf(" >\n");}
"break"           {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#              ->      < ", findIndex(TOKENS, yytext));         ECHO; printf(" >\n");}
"const"           {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#              ->      < ", findIndex(TOKENS, yytext));         ECHO; printf(" >\n");}
"continue"        {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#              ->      < ", findIndex(TOKENS, yytext));         ECHO; printf(" >\n");}
"delete"          {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#              ->      < ", findIndex(TOKENS, yytext));         ECHO; printf(" >\n");}
"else"            {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#              ->      < ", findIndex(TOKENS, yytext));         ECHO; printf(" >\n");}
"for"             {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#              ->      < ", findIndex(TOKENS, yytext));         ECHO; printf(" >\n");}
"if"              {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#              ->      < ", findIndex(TOKENS, yytext));         ECHO; printf(" >\n");}
"return"          {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#              ->      < ", findIndex(TOKENS, yytext));         ECHO; printf(" >\n");}
"struct"          {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#              ->      < ", findIndex(TOKENS, yytext));         ECHO; printf(" >\n");}
"typedef"         {printf("#TOKEN: %d# | #TYPE: KEYWORD#              ->      < ",  findIndex(TOKENS, yytext));         ECHO; printf(" >\n");}
"true"            {printf("#TOKEN: %d# | #TYPE: KEYWORD#              ->      < ",  findIndex(TOKENS, yytext));         ECHO; printf(" >\n");}
"false"           {printf("#TOKEN: %d# | #TYPE: KEYWORD#              ->      < ",  findIndex(TOKENS, yytext));         ECHO; printf(" >\n");} 

"+"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"-"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"*"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"/"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"+="              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"-="              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"*="              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"/="              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"++"              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"--"              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"&&"              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"||"              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"&"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"|"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"="               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"=="              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"<<"              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
">>"              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
"<"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
">"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
","               {printf("#TOKEN: %d# | #TYPE: SEPERATOR#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}
";"               {printf("#TOKEN: %d# | #TYPE: SEMICOLON#            ->      ",    findIndex(TOKENS, yytext));         ECHO; printf("\n");}


{STRING}          {printf("#TOKEN: %d# | #TYPE: STRING#               ->      ",    findIndex(TOKENS, "string"));       ECHO; printf("\n");}
{INCLUDE}         {printf("#TOKEN: %d# | #TYPE: INCLUDE#              ->      ",    findIndex(TOKENS, "include"));      ECHO; printf("\n");}
{PARENTHESIS}     {printf("#TOKEN: %d# | #TYPE: PARENTHESES#          ->      ",    findIndex(TOKENS, "parenthesis"));  ECHO; printf("\n");}
{DATATYPE}        {printf("#TOKEN: %d# | #TYPE: DATA TYPE#            ->      ",    findIndex(TOKENS, "Datatype"));     ECHO; printf("\n");}
{INT}             {printf("#TOKEN: %d# | #TYPE: INT VALUE#            ->      ",    findIndex(TOKENS, "int"));          ECHO; printf("\n");}
{FLOAT}           {printf("#TOKEN: %d# | #TYPE: FLOAT VALUE#          ->      ",    findIndex(TOKENS, "float"));        ECHO; printf("\n");}
{SIGNEDINT}       {printf("#TOKEN: %d# | #TYPE: SIGNED INT VALUE#     ->      ",    findIndex(TOKENS, "signed int"));   ECHO; printf("\n");}
{SIGNEDFLOAT}     {printf("#TOKEN: %d# | #TYPE: SIGNED FLOAT VALUE#   ->      ",    findIndex(TOKENS, "signed float")); ECHO; printf("\n");}
{VARINC}          {printf("#TOKEN: %d# | #TYPE: INCRISE VARIABLE#     ->      ",    findIndex(TOKENS, "VAR++"));        ECHO; printf("\n");}
{VARDEC}          {printf("#TOKEN: %d# | #TYPE: DECRISE VARIABLE#     ->      ",    findIndex(TOKENS, "VAR--"));        ECHO; printf("\n");}
{UNS}             {printf("#TOKEN: %d# | #TYPE: NAMESPACE#            ->      ",    findIndex(TOKENS, "UNS"));          ECHO; printf("\n");}
{IDENTIFIRE}      {printf("#TOKEN: %d# | #TYPE: IDENTIFIRE#           ->      ",    findIndex(TOKENS, "identifire"));   ECHO; printf("\n");}

.                 {yyerror("!!ERROR!! | UNKNOWN CHAR IN LINE:", line, 0); ECHO; printf(">\n\n"); exit(1);}
%% 




int yywrap(void){return 1;}

int yyerror(char *errMsg, int  line, bool nl)
{
    if (nl)
        fprintf(stderr, "\n%s %d\t<\n\n", errMsg, line);
    else
        fprintf(stderr, "\n%s %d\t<", errMsg, line);
}

size_t findIndex(const char *arr[], const char *val)
{
    int arrLen = 48;
    size_t index = -1;


    for (size_t i = 0; i < arrLen; i++)
    {    
        if (!strcmp(arr[i], val))
        {
            index = i;
            break;
        }
    }

    return index;
}


