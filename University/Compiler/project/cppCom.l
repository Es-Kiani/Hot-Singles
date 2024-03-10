%{
#include <stdio.h>
#include <stdbool.h>

int yyerror(char *errMsg, int line, bool nl);

int line = 1;

size_t findIndex(const char *arr[], const char *val, int arrLen);

const char *KEYWORDS[] = {"auto", "break", "const", "continue", "delete", "else", "for", "if", "return", "struct", "typedef", "true", "false"};
// 13
// !X! cin, cout !X!

const char *OPERRATORS[] = {"+", "-", "*", "/", "+=", "-=", "*=", "/=", "++", "--", "&&", "||", "&", "|", "=", "==", "<<", ">>", "<", ">", ",", ";"};
// 22
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
{COMMENT}         {printf("#TOKEN: %d# | #TYPE: COMMENT#\n", 47);}

"auto"            {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#\t->\t< ",  findIndex(KEYWORDS, yytext,    13));  ECHO; printf(" >\n");}
"break"           {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#\t->\t< ",  findIndex(KEYWORDS, yytext,    13));  ECHO; printf(" >\n");}
"const"           {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#\t->\t< ",  findIndex(KEYWORDS, yytext,    13));  ECHO; printf(" >\n");}
"continue"        {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#\t->\t< ",  findIndex(KEYWORDS, yytext,    13));  ECHO; printf(" >\n");}
"delete"          {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#\t->\t< ",  findIndex(KEYWORDS, yytext,    13));  ECHO; printf(" >\n");}
"else"            {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#\t->\t< ",  findIndex(KEYWORDS, yytext,    13));  ECHO; printf(" >\n");}
"for"             {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#\t->\t< ",  findIndex(KEYWORDS, yytext,    13));  ECHO; printf(" >\n");}
"if"              {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#\t->\t< ",  findIndex(KEYWORDS, yytext,    13));  ECHO; printf(" >\n");}
"return"          {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#\t->\t< ",  findIndex(KEYWORDS, yytext,    13));  ECHO; printf(" >\n");}
"struct"          {printf("#TOKEN: 0%d# | #TYPE: KEYWORD#\t->\t< ",  findIndex(KEYWORDS, yytext,    13));  ECHO; printf(" >\n");}
"typedef"         {printf("#TOKEN: %d# | #TYPE: KEYWORD#\t->\t< ",   findIndex(KEYWORDS, yytext,    13));  ECHO; printf(" >\n");}
"true"            {printf("#TOKEN: %d# | #TYPE: KEYWORD#\t->\t< ",   findIndex(KEYWORDS, yytext,    13));  ECHO; printf(" >\n");}
"false"           {printf("#TOKEN: %d# | #TYPE: KEYWORD#\t->\t< ",   findIndex(KEYWORDS, yytext,    13));  ECHO; printf(" >\n");}

"+"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"-"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"*"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"/"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"+="              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"-="              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"*="              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"/="              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"++"              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"--"              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"&&"              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"||"              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"&"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"|"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"="               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"=="              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"<<"              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
">>"              {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
"<"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
">"               {printf("#TOKEN: %d# | #TYPE: OPERRATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
","               {printf("#TOKEN: %d# | #TYPE: SEPERATOR#\t->\t< ", findIndex(OPERRATORS, yytext,  22));  ECHO; printf(" >\n");}
;                 {printf("#TOKEN: %d# | #TYPE: SEMICOLON#\t->\t< ", 34);        ECHO; printf(" >\n");}


{STRING}          {printf("#TOKEN: %d# | #TYPE: STRING#\t->\t", 35);             ECHO; printf("\n");}
{INCLUDE}         {printf("#TOKEN: %d# | #TYPE: INCLUDE#\t->\t", 36);            ECHO; printf("\n");}
{PARENTHESIS}     {printf("#TOKEN: %d# | #TYPE: PARENTHESES#\t->\t", 37);        ECHO; printf("\n");}
{DATATYPE}        {printf("#TOKEN: %d# | #TYPE: DATA TYPE#\t->\t", 45);          ECHO; printf("\n");}
{INT}             {printf("#TOKEN: %d# | #TYPE: INT VALUE#\t->\t", 39);          ECHO; printf("\n");}
{FLOAT}           {printf("#TOKEN: %d# | #TYPE: FLOAT VALUE#\t->\t", 40);        ECHO; printf("\n");}
{SIGNEDINT}       {printf("#TOKEN: %d# | #TYPE: SIGNED INT VALUE#\t->\t", 41);   ECHO; printf("\n");}
{SIGNEDFLOAT}     {printf("#TOKEN: %d# | #TYPE: SIGNED FLOAT VALUE#\t->\t", 42); ECHO; printf("\n");}
{VARINC}          {printf("#TOKEN: %d# | #TYPE: INCRISE VARIABLE#\t->\t", 43);   ECHO; printf("\n");}
{VARDEC}          {printf("#TOKEN: %d# | #TYPE: DECRISE VARIABLE#\t->\t", 44);   ECHO; printf("\n");}
{UNS}             {printf("#TOKEN: %d# | #TYPE: NAMESPACE#\t->\t", 46);          ECHO; printf("\n");}
{IDENTIFIRE}      {printf("#TOKEN: %d# | #TYPE: IDENTIFIRE#\t->\t", 38);         ECHO; printf("\n");}

.                 {yyerror("!!ERROR!! | UNKNOWN CHAR IN LINE:", line, 0); ECHO; printf(">\n\n"); exit(1);}
%% 



int yywrap(void){return 1;}

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


int yyerror(char *errMsg, int  line, bool nl)
{
    if (nl)
        fprintf(stderr, "\n%s %d\t<\n\n", errMsg, line);
    else
        fprintf(stderr, "\n%s %d\t<", errMsg, line);
}

size_t findIndex(const char *arr[], const char *val, int arrLen)
{
    // int arrLen = 0;
    // while (arr[arrLen++] != NULL) {};

    // int arrLen = sizeof(arr) / sizeof(char*);

    // printf("%d\n", arrLen);



    size_t index = -1;


    for (size_t i = 0; i < arrLen; i++)
    {    
        if (!strcmp(arr[i], val))
        {
            index = i;
            break;
        }
    }


    if (arr == OPERRATORS && index != -1){return index+13;}
    return index;
}


