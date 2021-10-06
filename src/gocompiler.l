%{
    // Tomás Mendes - 2019232272
    // Joel Oliveira - 2019227468
%}

letter  [a-zA-Z]
number  [0-9]

%X INT BCOMMENT LCOMMENT

%%

";"				{fprintf(yyout, "SEMICOLON\n");}
","				{fprintf(yyout, "COMMA\n");}
"_"				{fprintf(yyout, "BLANKID\n");}
"="				{fprintf(yyout, "ASSIGN\n");}
"*"				{fprintf(yyout, "STAR\n");}
"/"				{fprintf(yyout, "DIV\n");}
"-"				{fprintf(yyout, "MINUS\n");}
"+"				{fprintf(yyout, "PLUS\n");}
"=="			{fprintf(yyout, "EQ\n");}
">="			{fprintf(yyout, "GE\n");}
">"				{fprintf(yyout, "GT\n");}
"{"				{fprintf(yyout, "LBRACE\n");}
"<="			{fprintf(yyout, "LE\n");}
"("				{fprintf(yyout, "LPAR\n");}
"["				{fprintf(yyout, "LSQ\n");}	
"<"				{fprintf(yyout, "LT\n");}
"%"				{fprintf(yyout, "MOD\n");}
"!="			{fprintf(yyout, "NE\n");}
"!"				{fprintf(yyout, "NOT\n");}
"&&"			{fprintf(yyout, "AND\n");}
"||"			{fprintf(yyout, "OR\n");}
"}"				{fprintf(yyout, "RBRACE\n");}
")"				{fprintf(yyout, "RPAR\n");}
"]"				{fprintf(yyout, "RSQ\n");}
"package"		{fprintf(yyout, "PACKAGE\n");}
"return"		{fprintf(yyout, "RETURN\n");}
"else"			{fprintf(yyout, "ELSE\n");}
"for"			{fprintf(yyout, "FOR\n");}
"if"			{fprintf(yyout, "IF\n");}
"var"			{fprintf(yyout, "VAR\n");}
"int"			{fprintf(yyout, "INT\n");}
"float32"		{fprintf(yyout, "FLOAT32\n");}
"bool"			{fprintf(yyout, "BOOL\n");}
"string"		{fprintf(yyout, "STRING\n");}
"fmt.Println"	{fprintf(yyout, "PRINT\n");}
"strconv.Atoi"	{fprintf(yyout, "PARSEINT\n");}
"func"			{fprintf(yyout, "FUNC\n");}
"os.Args"		{fprintf(yyout, "CMDARGS\n");}
"++"|"--"		{fprintf(yyout, "RESERVED\n");}
"/*"			{fprintf(yyout, "BCOMMENT\n"); BEGIN BCOMMENT;}
"//"			{fprintf(yyout, "LCOMMENT\n"); BEGIN LCOMMENT;}
" "             {fprintf(yyout, "");}

{number}+			                {fprintf(yyout, "INTLIT(%s)\n", yytext);}
{number}*"."{1}{number}+		    {fprintf(yyout, "REALLIT(%s)\n", yytext);}
{letter}|({letter}|{number}|"_")* 	{fprintf(yyout, "ID(%s)\n", yytext);}
\"[^\"]*\"                          {fprintf(yyout, "STRLIT(%s)\n", yytext);}

.				{fprintf(yyout, "%s", yytext);}
\n				{fprintf(yyout, "");}

<BCOMMENT>"*/" 	{fprintf(yyout, "END BCOMMENT\n"); BEGIN 0;}
<BCOMMENT>\n 	{fprintf(yyout, "\n");}
<BCOMMENT>. 	{ECHO;}

<LCOMMENT>\n 	{fprintf(yyout, "\n"); BEGIN 0;}
<LCOMMENT>. 	{ECHO;}

%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}