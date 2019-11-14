/**
 * Minijava Lexer specification
 *
 *
 */
%%

%state BLOCK_COMMENT LINE_COMMENT
%class MinijavaLexer
%char
%line
%cup
%eofval{
   return new MinijavaToken (MinijavaSymbol.EOF, null);
%eofval}
%yylexthrow{ 
   Exception
%yylexthrow} 


STRING_LITERAL = [\"][a-zA-Z0-9_.+-/!<>=:;\|\*\ ]*[\"]
IDENTIFIER = [a-zA-z_][a-zA-Z0-9_]*
INTEGER_LITERAL = [0-9]+
FLOATING_POINT_LITERAL = ([0-9]*"."[0-9]+)"f"
WHITESPACE = [\ \t\r\n]+

%%
<YYINITIAL> "/*" { yybegin (BLOCK_COMMENT); }
<YYINITIAL> "//" { yybegin (LINE_COMMENT); }
<YYINITIAL> "public" { return new MinijavaToken (MinijavaSymbol.PUBLIC, yychar, yychar + 6, yytext(), yyline); }
<YYINITIAL> "private" { return new MinijavaToken (MinijavaSymbol.PRIVATE, yychar, yychar + 7, yytext(), yyline); }
<YYINITIAL> "protected" { return new MinijavaToken (MinijavaSymbol.PROTECTED, yychar, yychar + 9, yytext(), yyline); }
<YYINITIAL> "class" { return new MinijavaToken (MinijavaSymbol.CLASS, yychar, yychar + 5, yytext(), yyline); }
<YYINITIAL> "static" { return new MinijavaToken (MinijavaSymbol.STATIC, yychar, yychar + 6, yytext(), yyline); }
<YYINITIAL> "for" { return new MinijavaToken (MinijavaSymbol.FOR, yychar, yychar + 3, yytext(), yyline); }
<YYINITIAL> "int" { return new MinijavaToken (MinijavaSymbol.INT, yychar, yychar + 3, yytext(), yyline); }
<YYINITIAL> "boolean" { return new MinijavaToken (MinijavaSymbol.BOOLEAN, yychar, yychar + 7, yytext(), yyline); }
<YYINITIAL> "float" { return new MinijavaToken (MinijavaSymbol.FLOAT, yychar, yychar + 5, yytext(), yyline); }
<YYINITIAL> "void" { return new MinijavaToken (MinijavaSymbol.VOID, yychar, yychar + 4, yytext(), yyline); }
<YYINITIAL> "nattin" { return new MinijavaToken (MinijavaSymbol.NULL_LITERAL, yychar, yychar + 6, yytext(), yyline); }
<YYINITIAL> "eh" { return new MinijavaToken (MinijavaSymbol.IF, yychar, yychar + 2, yytext(), yyline); }
<YYINITIAL> "orEh" { return new MinijavaToken (MinijavaSymbol.ELSEIF, yychar, yychar + 4, yytext(), yyline); }
<YYINITIAL> "orEvenJust" { return new MinijavaToken (MinijavaSymbol.ELSE, yychar, yychar + 10, yytext(), yyline); }
<YYINITIAL> "gospel" { return new MinijavaToken (MinijavaSymbol.BOOLEAN_LITERAL, yychar, yychar + 6, new Boolean (yytext()), yyline); }
<YYINITIAL> "bull" { return new MinijavaToken (MinijavaSymbol.BOOLEAN_LITERAL, yychar, yychar + 4, new Boolean (yytext()), yyline); }
<YYINITIAL> "[" { return new MinijavaToken (MinijavaSymbol.LBRACK, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> "]" { return new MinijavaToken (MinijavaSymbol.RBRACK, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> "{" { return new MinijavaToken (MinijavaSymbol.LBRACE, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> "}" { return new MinijavaToken (MinijavaSymbol.RBRACE, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> "&&" { return new MinijavaToken (MinijavaSymbol.ANDAND, yychar, yychar + 2, yytext(), yyline); }
<YYINITIAL> "||" { return new MinijavaToken (MinijavaSymbol.OROR, yychar, yychar + 2, yytext(), yyline); }
<YYINITIAL> "==" { return new MinijavaToken (MinijavaSymbol.EQEQ, yychar, yychar + 2, yytext(), yyline); }
<YYINITIAL> "!=" { return new MinijavaToken (MinijavaSymbol.NOTEQ, yychar, yychar + 2, yytext(), yyline); }
<YYINITIAL> "<" { return new MinijavaToken (MinijavaSymbol.LT, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> ">" { return new MinijavaToken (MinijavaSymbol.GT, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> "<=" { return new MinijavaToken (MinijavaSymbol.LTEQ, yychar, yychar + 2, yytext(), yyline); }
<YYINITIAL> ">=" { return new MinijavaToken (MinijavaSymbol.GTEQ, yychar, yychar + 2, yytext(), yyline); }
<YYINITIAL> "=" { return new MinijavaToken (MinijavaSymbol.EQ, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> "!" { return new MinijavaToken (MinijavaSymbol.NOT, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> "(" { return new MinijavaToken (MinijavaSymbol.LPAREN, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> ")" { return new MinijavaToken (MinijavaSymbol.RPAREN, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> ";" { return new MinijavaToken (MinijavaSymbol.SEMICOLON, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> "." { return new MinijavaToken (MinijavaSymbol.DOT, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> "+" { return new MinijavaToken (MinijavaSymbol.PLUS, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> "-" { return new MinijavaToken (MinijavaSymbol.MINUS, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> "/" { return new MinijavaToken (MinijavaSymbol.DIV, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> "*" { return new MinijavaToken (MinijavaSymbol.MULT, yychar, yychar + 1, yytext(), yyline); }
<YYINITIAL> {STRING_LITERAL} { return new MinijavaToken (MinijavaSymbol.STRING_LITERAL, yychar, yychar + yytext().length(), yytext(), yyline); }
<YYINITIAL> {INTEGER_LITERAL} { return new MinijavaToken (MinijavaSymbol.INTEGER_LITERAL, yychar, yychar + yytext().length(), new Integer (yytext()), yyline); }
<YYINITIAL> {FLOATING_POINT_LITERAL} { return new MinijavaToken (MinijavaSymbol.FLOATING_POINT_LITERAL, yychar, yychar + yytext().length(), new Float (yytext()), yyline); }
<YYINITIAL> {IDENTIFIER} { return new MinijavaToken (MinijavaSymbol.IDENTIFIER, yychar, yychar + yytext().length(), yytext(), yyline); }
<YYINITIAL> {WHITESPACE} { }
<BLOCK_COMMENT> "*/" { yybegin (YYINITIAL); }
<BLOCK_COMMENT> [\r\n]|[\r][\n] { }
<BLOCK_COMMENT> .  { }
<LINE_COMMENT> [\r\n]|[\r][\n] { yybegin (YYINITIAL); }
<LINE_COMMENT> .  { }
. { throw new Exception ("Lexical: unmatched input at line " + (yyline+1)); 
  }