import java.io.FileInputStream;
import java_cup.runtime.*;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;


public class KEDParser {

    public static void main (String args[]) {

       FileInputStream fin = null;


       if ( (args == null) || (args.length != 1)) {
          System.out.println ("Usage: java Minijava.testMJParse <input-file>");
          System.exit (-1);
       }
       try {
          System.out.println ("Loading source file: " + args[0]);
          MinijavaParser parser = new MinijavaParser(args[0]); //error here when parameter is args[0]

          System.out.println ("Parsing source file...");
          parser.parse();
          System.out.println ("Parsed OK");

          //
          // Do semantic analysis and code generation next...
          //

       } catch (Exception e) 
       {
           System.out.println ("Parse error: " + e.getMessage());
       }
    }

}