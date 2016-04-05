import java.util.Random;
import java.util.Arrays;

public class GPSort {

  public static int nSubsets;
  public static int sizeSubsets;

  public static void main(String[] args) {

    // Params handling
    if(args.length < 2) {
      System.err.println("Needs two arguments: <number of subsets> <size of subsets>");
      System.exit(0);
    }
    nSubsets = Integer.valueOf(args[0]);
    sizeSubsets = Integer.valueOf(args[1]);

    // Set initialization
    int[][] set = new int[nSubsets][];

    // Benchmark initialization
    long startTime = System.currentTimeMillis();
    initSet(set);
    long stopTime = System.currentTimeMillis();

    // Compute elapsed time
    long elapsedTime = stopTime - startTime;
    System.out.println("Time elapsed for initialization: " + elapsedTime/1000 + "s");

    // Benchmark mergeSort
    startTime = System.currentTimeMillis();
    int[] result = startMergeSort(set);
    stopTime = System.currentTimeMillis();

    // Compute elapsed time
    elapsedTime = stopTime - startTime;
    System.out.println("Time elapsed for merging: " + elapsedTime/1000 + "s");

    // Assertion check
    assert(nSubsets*sizeSubsets == result.length);
    int[] truth = result.clone();
    Arrays.sort(truth);
    assert(Arrays.equals(result,truth));

  }

  // Init the set with a random number from 0 to 100
  public static void initSet(int[][] set) {
    Random r = new Random();
    for(int i=0; i < nSubsets; i++) {
      int size = sizeSubsets; //r.nextInt(100);
      set[i] = new int[size];
      for(int j=0; j < size; j++) {
        set[i][j] = r.nextInt(100);
      }
      Arrays.sort(set[i]);
    }
  }

  // Merge A and B to C
  public static int[] merge2(int[] A, int[] B) {
    int a = A.length; // last index of A
    int b = B.length; // last index of C
    int k = a+b;      // size of merged array
    int i = 0,j = 0;
    int[] C = new int[k];
    while(i < a && j < b) {
      if(A[i] < B[j]) {
        C[i+j] = A[i++];
      } else {
        C[i+j] = B[j++];
      }
    }
    while(i < a) C[i+j] = A[i++];
    while(j < b) C[i+j] = B[j++];
    assert(i+j == k);
    return C;
  }

  // Print content of array A
  public static void printA(int[] A) {
    for(int i=0; i < A.length; i++) {
      System.out.print(A[i] + " ");
    }
    System.out.println();
  }

  // Starts the merge
  public static int[] startMergeSort(int[][] sets) {
    return mergeSets(half1(sets), half2(sets));
  }

  // Merge two sorted set in a recursive manner
  public static int[] mergeSets(int[][] setA, int[][] setB) {
    if(setA.length == 0 && setB.length == 0) return new int[0];
    if(setA.length == 0 && setB.length == 1) return setB[0];
    if(setA.length == 1 && setB.length == 0) return setA[0];
    if(setA.length == 1 && setB.length == 1) return merge2(setA[0],setB[0]);

    int[] subsetA = mergeSets(half1(setA), half2(setA));
    int[] subsetB = mergeSets(half1(setB), half2(setB));
    return merge2(subsetA, subsetB);
  }

  // Gives the first half of a set
  public static int[][] half1(int[][] set) {
    return Arrays.copyOfRange(set, 0, set.length/2);
  }

  // Gives the second half of a set
  public static int[][] half2(int[][] set) {
    return Arrays.copyOfRange(set, set.length/2, set.length);
  }

}
