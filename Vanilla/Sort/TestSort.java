import java.util.Arrays;

public class TestSort {

  public static void main(String[] args) {
    int[][] test = new int[][]{ {1,2,3} };
    testA(test);
    test = new int[][]{ {1,2,3}, {2,3,4} };
    testA(test);
    test = new int[][]{ {1,2,3}, {2,3,4}, {0,10,11} };
    testA(test);
    test = new int[][]{ };
    testA(test);
    test = new int[][]{ {1,2,3}, {2,3,4}, {0,10,11}, {-1,10} };
    testA(test);
  }

  public static void testA(int[][] A) {
    System.out.println("TestA: ");
    printA(A);
    printA(getLowerSubsets(A,A.length/2));
    printA(getUpperSubsets(A,A.length/2));
    System.out.println();
  }

  public static int[][] getLowerSubsets(int[][] set, int middle) {
    // if(middle == 0) return new int[0][];
    // int[][] result = new int[middle][];
    // for(int i=0; i < middle; i++) {
    //   result[i] = set[i];
    // }
    // return result;
    return Arrays.copyOfRange(set, 0, middle);
  }

  public static int[][] getUpperSubsets(int[][] set, int middle) {
    // int[][] result = new int[set.length - middle][];
    // for(int i=middle; i < set.length; i++) {
    //   result[i-middle] = set[i];
    // }
    // return result;
    return Arrays.copyOfRange(set, middle, set.length);
  }

  public static void printA(int[][] A) {
    System.out.print("{");
    for(int i = 0; i < A.length; i++) {
      System.out.print("{");
      for(int j = 0; j < A[i].length; j++) {
        System.out.print(A[i][j] + " ");
      }
      System.out.print("}");
    }
    System.out.println("}");
  }

}
