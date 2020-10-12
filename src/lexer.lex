%option yylineno
/*** Definition Section has one variable 
which can be accessed inside yylex() 
and main() ***/
%{ 
%} 

%%
else|if|int|return|void|while {printf("\(%i,KEY,\"%s\"\) \n", yylineno, yytext);} 
main {printf("\(%i,ID,\"%s\"\) \n", yylineno, yytext);} 
[-!$%^&*()_+|~=`{}\[\]:";'<>?,.\/] {printf("\(%i,SYM,\"%s\"\) \n", yylineno, yytext);}  
[0-9]*[0-9] {printf("\(%i,NUM,\"%s\"\) \n", yylineno, yytext);} 
[a-zA-Z]([a-zA-Z]|[0-9])* {printf("\(%i,ID,\"%s\"\) \n", yylineno, yytext);} 
[ \t]|[ \n]|\/\/(.*)|\/\*(.*)*\/ {}
(\/\*)(.*)|if\(\)|while\(\) {printf("\(%i,ERROR,\"%s\"\) \n", yylineno, yytext); return -1;}
%% 

/*** Code Section prints the number of 
capital letter present in the given input***/
int yywrap(){} 
int main(){ 

char filename1[50];
FILE *fp = fopen(filename1, "r");
yyin = fp;
yylex(); 
fclose(yyin);

return 0; 
} 
