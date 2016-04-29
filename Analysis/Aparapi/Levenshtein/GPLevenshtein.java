import com.amd.aparapi.Kernel;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;

public class GPLevenshtein {

  public static void main(String [] args) {

    // Params handling
    if(args.length < 2) {
      System.err.println("Needs two arguments: <file a> <file b>");
      System.exit(0);
    }
    String filea = args[0];
    String fileb = args[1];
    char[] a = null; // First string
    char[] b = null; // Second string

    // Reading files, filling a & b
    try {
      FileReader fra = new FileReader(filea);
      BufferedReader bra = new BufferedReader(fra);
      a = bra.readLine().toCharArray();
      FileReader frb = new FileReader(fileb);
      BufferedReader brb = new BufferedReader(frb);
      b = brb.readLine().toCharArray();
    } catch (IOException e) {
      e.printStackTrace();
      System.exit(0);
    }

    // --------------------------------
    long startTime = System.currentTimeMillis();
    // --- Start of benchmark zone --->
    new AparapiLevenshtein(a,b).execute(a.length+1); //System.out.println("Execution mode = "+kernel.getExecutionMode());
    // <--- End of benchmark zone -----
    long stopTime = System.currentTimeMillis();
    // --------------------------------

    // Benchmark time elapsed computation
    long elapsedTime = stopTime - startTime;

    // Output
    System.out.println(elapsedTime/1000);
  }

}

// Is the class that sends job on the GPU
class AparapiLevenshtein extends Kernel {

  char[] a; // The first string
  char[] b; // The second string

  int[] costs; // Will contain the result
  int blen;    // https://github.com/steelted/aparapi/issues/117

  public AparapiLevenshtein(char[] a, char[] b) {

    this.a = a;
    this.b = b;
    this.blen = b.length;

    costs = new int [b.length + 1];
    for (int j = 0; j < costs.length; j++)
      costs[j] = j;

  }

  @Override
  // Kernel method
  public void run() {
    int i = getGlobalId(); // The id of the thread
    if(i==0) return;

    costs[0] = i;
    int nw = i - 1;
    for (int j = 1; j <= blen; j++) {
      int cj = min(1 + min(costs[j], costs[j - 1]), a[i - 1] == b[j - 1] ? nw : nw + 1);
      nw = costs[j];
      costs[j] = cj;
    }

  }

  public int min(int a, int b) {
    return a < b ? a : b;
  }

}
