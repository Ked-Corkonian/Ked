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

## Currently parsable

**Types**  

`true` = `gospel`  
`false` = `bull`  
`null` = `nattin`


**Conditional statements**  

*The `KED` equivalent of a `if`, `else if`, `else`*  

```
    eh (a == 2) {
      a = 4
    } 
    orEh (b == 1) {
      a = 7
    }
    orEvenJust {
      a = 4
    };

```

**Loops**  

*The `KED` equivalent of a `while` loop*  

```
    eraGoOnSure(a == 2){
      a = 5
    }
```

*The `KED` equivalent of a `for` loop*

```
    eraSureLook(int c = 0; c < 1; c = (c+1)){
        a = 6
    }
```


Created by [Conor O'Donoghue](https://github.com/ConorOd) and [Deirdre Hegarty](https://github.com/deehegarty), inspired by https://adam-lynch.github.io/ked/
