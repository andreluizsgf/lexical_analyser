/*** Definition Section has one variable 
which can be accessed inside yylex() 
and main() ***/
%{ 
int count = 0; 
%} 

%%
else|if|int|return|void|while {printf("\(%i,KEY,\"%s\"\) \n", yylineno, yytext);} 
main {printf("\(%i,ID,\"%s\"\) \n", yylineno, yytext);} 
(int|void|return) {printf("\(%i,KEY,\"%s\"\) \n", yylineno, yytext);} 
[-!$%^&*()_+|~=`{}\[\]:";'<>?,.\/] {printf("\(%i,SYM,\"%s\"\) \n", yylineno, yytext);}  
[0-9]*[0-9] {printf("\(%i,NUM,\"%s\"\) \n", yylineno, yytext);} 
[a-zA-Z]([a-zA-Z]|[0-9])* {printf("\(%i,ID,\"%s\"\) \n", yylineno, yytext);} 
[ \t] {} 
\/\/(.*) {} 
\n {return -1;} 
%% 

/*** Code Section prints the number of 
capital letter present in the given input***/
int yywrap(){} 
int main(){ 

FILE *fp; 
char filename[50]; 
printf("Enter the filename: \n"); 
scanf("%s",filename); 
fp = fopen(filename,"r"); 
yyin = fp; 

yylex(); 

return 0; 
} 
