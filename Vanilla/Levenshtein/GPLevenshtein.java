import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;

public class GPLevenshtein {

  public static void main(String [] args) {

    if(args.length < 2) {
      System.err.println("Needs two arguments: <file a> <file b>");
      System.exit(0);
    }
    String filea = args[0];
    String fileb = args[1];
    String a = null;
    String b = null;

    try {
      FileReader fra = new FileReader(filea);
      BufferedReader bra = new BufferedReader(fra);
      a = bra.readLine();
      FileReader frb = new FileReader(fileb);
      BufferedReader brb = new BufferedReader(frb);
      b = brb.readLine();
    } catch (IOException e) {
      e.printStackTrace();
      System.exit(0);
    }

    // --------------------------------
    long startTime = System.currentTimeMillis();
    // --- Start of benchmark zone --->
    int dist = distance(a, b);
    // <--- End of benchmark zone -----
    long stopTime = System.currentTimeMillis();
    // --------------------------------

    // Benchmark time elapsed computation
    long elapsedTime = stopTime - startTime;

    // Output
    System.out.println(elapsedTime/1000);
    // System.out.println("distance: " + dist);
  }

  // Compute the distance between a and b
  public static int distance(String a, String b) {
    int [] costs = new int [b.length() + 1];
    for (int j = 0; j < costs.length; j++)
      costs[j] = j;
    for (int i = 1; i <= a.length(); i++) {
      costs[0] = i;
      computeRow(costs, i, a, b);
    }
    return costs[b.length()];
  }

  // Compute a single row in the distance process
  public static void computeRow(int[] costs, int i, String a, String b) {
    int nw = i - 1;
    for (int j = 1; j <= b.length(); j++) {
      int cj = Math.min(1 + Math.min(costs[j], costs[j - 1]), a.charAt(i - 1) == b.charAt(j - 1) ? nw : nw + 1);
      nw = costs[j];
      costs[j] = cj;
    }
  }

}
