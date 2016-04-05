public class GPLevenshtein {

    public static int distance(String a, String b) {
        a = a.toLowerCase();
        b = b.toLowerCase();
        // i == 0
        int [] costs = new int [b.length() + 1];
        for (int j = 0; j < costs.length; j++)
            costs[j] = j;
        for (int i = 1; i <= a.length(); i++) {
            // j == 0; nw = lev(i - 1, j)
            costs[0] = i;
            computeRow(costs, i, a, b);
        }
        return costs[b.length()];
    }

    public static void main(String [] args) {

      if(args.length < 2) {
        System.err.println("Needs two arguments: <string a> <string b>");
        System.exit(0);
      }
      String a = args[0];
      String b = args[1];

      // Benchmark initialization
      long startTime = System.currentTimeMillis();
      int dist = distance(a, b);
      long stopTime = System.currentTimeMillis();

      // Compute elapsed time
      long elapsedTime = stopTime - startTime;
      System.out.println(elapsedTime/1000);


      // System.out.println("distance: " + dist);
    }

    public static void computeRow(int[] costs, int i, String a, String b) {
      int nw = i - 1;
      for (int j = 1; j <= b.length(); j++) {
          int cj = Math.min(1 + Math.min(costs[j], costs[j - 1]), a.charAt(i - 1) == b.charAt(j - 1) ? nw : nw + 1);
          nw = costs[j];
          costs[j] = cj;
      }
    }

}
