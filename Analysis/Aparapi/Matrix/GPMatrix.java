import java.util.Random;
import com.amd.aparapi.Kernel;

public class GPMatrix {

  public static int verbose = 0; // level 0,1,2
  public static int size;

  public static void main(String[] args) {

    // Params handling
    if(args.length < 1) {
      System.err.println("Needs size argument");
      System.exit(0);
    }
    size = Integer.valueOf(args[0]);

    // Matrix declaration
    double[][] A = new double[size][size];
    double[][] B = new double[size][size];
    double[][] C = new double[size][size];

    matrixInit(A,B);

    // --------------------------------
    long startTime = System.currentTimeMillis();
    // --- Start of benchmark zone --->
    new AparapiMatrixMul(A,B,C, size).execute(size);
    // <--- End of benchmark zone -----
    long stopTime = System.currentTimeMillis();
    // --------------------------------

    // Benchmark time elapsed computation
    long elapsedTime = stopTime - startTime;

    // Output
    if(verbose > 0) System.out.println("Time elapsed: " + elapsedTime/1000 + "s");
    System.out.println(elapsedTime/1000);

  }

  // Matrix random initialization of A and B
  public static void matrixInit(double[][] A, double[][] B) {
    Random r = new Random(1);
    for(int row=0; row < size; row++) {
      for(int col=0; col < size; col++) {
        A[row][col] = r.nextDouble();
        B[row][col] = r.nextDouble();
      }
    }
  }

}

// Is the class that sends job on the GPU
class AparapiMatrixMul extends Kernel {

  double[][] A; // Matrix A
  double[][] B; // Matrix B
  double[][] C; // Matrix C, the result of AxB
  int size;

  public AparapiMatrixMul(double[][] A, double[][] B, double[][] C, int size) {
    this.A = A; this.B = B; this.C = C;
    this.size = size;
  }

  @Override
  // Kernel method
  public void run() {
    int i = getGlobalId(); // The id of the thread

    for(int j=0; j < size; j++) {
      double sum = 0.0;
      for(int k=0; k < size; k++) {
        sum += A[i][k] * B[k][j];
      }
      C[i][j] = sum;
    }
  }

}
