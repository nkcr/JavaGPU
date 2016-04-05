import java.math.BigInteger;

public class GPPrime {

  public static BigInteger number;
  public static int verbose = 0;

  public static void main(String[] args) {

    // Params handling
    if(args.length < 1) {
      System.err.println("Needs one argument: <number to factorize>");
      System.exit(0);
    }
    number = new BigInteger(args[0]);

    primeFactor(number);
  }

  public static void primeFactor(BigInteger n) {
    BigInteger i = new BigInteger("2");
    for(; i.compareTo(n.divide(i)) <= 0; i = i.add(BigInteger.ONE)) {
      if(verbose > 1) System.out.println("i = " + i);
      while(n.mod(i).equals(BigInteger.ZERO)) {
        System.out.println(n + "%" + i + " = 0");
        // System.out.println("Found " + n);
        n = n.divide(i);
        if(verbose > 1) System.out.println("\t new n = " + n);
      }
    }
  }

}
