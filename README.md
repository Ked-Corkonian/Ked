# Ked

### The Corkonian programming language

Before starting install jflex - current version 1.7.1

```bash
# install jflex on mac
brew install jflex
```

```bash

# generate lexer 
jflex  Minijava.flex

# include missing code block in MiniJavaLexer.java before continuing (see below)
# generate minijavaParser & minijavaSymbols using cup
java -cp dependencies/java-cup-11b.jar:. java_cup.Main -parser MinijavaParser -symbols MinijavaSymbol < Minijava.cup

# compile *.java
javac -cp dependencies/java-cup-11b.jar:. MinijavaSymbol.java MinijavaToken.java MinijavaLexer.java MinijavaParser.java KEDParser.java

# parse input file with KEDParser
java -cp dependencies/java-cup-11b.jar:. KEDParser InputFile.mj
```

**Include the following in `MinijavaLexer.java` - temp solution for issue**
```java
 MinijavaLexer(java.io.InputStream in){
   this(new java.io.InputStreamReader(in));
 }
```

Created by [Conor O'Donoghue](https://github.com/ConorOd) and [Deirdre Hegarty](https://github.com/deehegarty), inspired by https://adam-lynch.github.io/ked/
