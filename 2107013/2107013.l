DIGIT       [0-9]
INTEGER     {DIGIT}+
FLOATING    {DIGIT}+"."{DIGIT}+
Variable    [A-Za-z_][A-Za-z_0-9]*
Condition   (<|<=|>|>=|!=|=)

%{
#include <stdio.h>
#include <string.h>
FILE *yyout;
%}

%option noyywrap

%%

"--".* {
    printf("This is a single line comment\n\n");
    fprintf(yyout,"This is a single line comment\n\n");
}

"-->"([^<]|[\n])*"<--" {
    printf("This is a multi line comment\n\n");
    fprintf(yyout,"This is a multi line comment\n\n");
}

"purno" {
    printf("Integer type\n\n");
    fprintf(yyout,"Integer type\n\n");
}

"doshomik" {
    printf("Decimal type\n\n");
    fprintf(yyout,"Decimal type\n\n");
}

"sottoMitti" {
    printf("Boolean type\n\n");
    fprintf(yyout,"Boolean type\n\n");
}

"khali" {
    printf("Void type (khali)\n\n");
    fprintf(yyout,"Void type (khali)\n\n");
}

"dekhaw" {
    printf("Print command\n\n");
    fprintf(yyout,"Print command\n\n");
}

"nao" {
    printf("Input command\n\n");
    fprintf(yyout,"Input command\n\n");
}

"shuru" {
    printf("Block start\n\n");
    fprintf(yyout,"Block start\n\n");
}

"sesh" {
    printf("Block end\n\n");
    fprintf(yyout,"Block end\n\n");
}

"jodi" {
    printf("If condition\n\n");
    fprintf(yyout,"If condition\n\n");
}

"nahole_jodi" {
    printf("Else if condition\n\n");
    fprintf(yyout,"Else if condition\n\n");
}

"nahole" {
    printf("Else condition\n\n");
    fprintf(yyout,"Else condition\n\n");
}

"ghurao" {
    printf("For loop keyword\n\n");
    fprintf(yyout,"For loop keyword\n\n");
}

"jotokkhon" {
    printf("While loop keyword\n\n");
    fprintf(yyout,"While loop keyword\n\n");
}

"mukkho" {
    printf("Main function\n\n");
    fprintf(yyout,"Main function\n\n");
}

"phireDao" {
    printf("Return statement\n\n");
    fprintf(yyout,"Return statement\n\n");
}

{Variable}"(" {
    printf("Function name %s\n\n", yytext);
    fprintf(yyout,"Function name %s\n\n", yytext);
}

"+"  { printf("Addition operator\n\n"); fprintf(yyout,"Addition operator\n\n"); }
"-"  { printf("Subtraction operator\n\n"); fprintf(yyout,"Subtraction operator\n\n"); }
"*"  { printf("Multiplication operator\n\n"); fprintf(yyout,"Multiplication operator\n\n"); }
"/"  { printf("Division operator\n\n"); fprintf(yyout,"Division operator\n\n"); }

">=" { printf("Greater than or equal\n\n"); fprintf(yyout,"Greater than or equal\n\n"); }
"<=" { printf("Less than or equal\n\n"); fprintf(yyout,"Less than or equal\n\n"); }
">"  { printf("Greater than\n\n"); fprintf(yyout,"Greater than\n\n"); }
"<"  { printf("Less than\n\n"); fprintf(yyout,"Less than\n\n"); }
"!=" { printf("Not equal\n\n"); fprintf(yyout,"Not equal\n\n"); }
"="  { printf("Assignment operator\n\n"); fprintf(yyout,"Assignment operator\n\n"); }

";" {
    printf("Statement terminator\n\n");
    fprintf(yyout,"Statement terminator\n\n");
}

{FLOATING} {
    printf("Decimal value\n\n");
    fprintf(yyout,"Decimal value\n\n");
}

{INTEGER} {
    printf("Integer value\n\n");
    fprintf(yyout,"Integer value\n\n");
}

{Variable} {
    printf("Identifier %s\n\n", yytext);
    fprintf(yyout,"Identifier %s\n\n", yytext);
}

[ \t\n]+ ;
. ;

%%

int main() {
    yyin  = fopen("input.bs","r");
    yyout = fopen("output.bs","w");
    yylex();
    return 0;
}
