class MinijavaToken extends java_cup.runtime.Symbol {

   public int line;

   public MinijavaToken (int sym) {
      super(sym);
   }

   public MinijavaToken (int sym, Object value) {
      super(sym, value);
   }

   public MinijavaToken (int sym, int left, int right, Object value, int line) {
      super(sym, left, right, value);
      this.line = line;
   }

  /**
   * Returns the token ID of this token. 
   *
   */
   public int getTokenID () {
      return this.sym;
   }

  /**
   * Returns this token as a String
   *
   */
   public String toString () {
      return "TOKEN VALUE: |" + sym + "|" + " -> " + value;
   }

}