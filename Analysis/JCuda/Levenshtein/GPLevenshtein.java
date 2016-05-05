import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;
import jcuda.*;
import jcuda.runtime.*;
import jcuda.driver.*;
import static jcuda.driver.JCudaDriver.*;

public class GPLevenshtein {

  public static void main(String [] args) {

    if(args.length < 2) {
      System.err.println("Needs two arguments: <file a> <file b>");
      System.exit(0);
    }
    String filea = args[0];
    String fileb = args[1];
    char[] a = null;
    char[] b = null;

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

    // Initialize the costs array
    int[] costs = new int[a.length+1];

    // Enable exception
    JCudaDriver.setExceptionsEnabled(true);

    // Initialize the driver and create a context for the first device
    cuInit(0);
    CUdevice device = new CUdevice();
    cuDeviceGet(device, 0);
    CUcontext context = new CUcontext();
    cuCtxCreate(context, 0, device);

    // Load the CUDA kernel ptx file
    CUmodule module = new CUmodule();
    cuModuleLoad(module, "../JCudaLevenstein.ptx");

    // Obtain a function pointer to the kernel function
    CUfunction function = new CUfunction();
    cuModuleGetFunction(function, module, "leven");

    // Allocate the device input data, and copy the host input data
    // to the device
    int ptrSize = a.length * Sizeof.CHAR;
    CUdeviceptr deviceInputA = new CUdeviceptr();
    cuMemAlloc(deviceInputA, ptrSize);
    cuMemcpyHtoD(deviceInputA, Pointer.to(a), ptrSize);

    CUdeviceptr deviceInputB = new CUdeviceptr();
    cuMemAlloc(deviceInputB, ptrSize);
    cuMemcpyHtoD(deviceInputB, Pointer.to(b), ptrSize);

    CUdeviceptr deviceInputCosts = new CUdeviceptr();
    cuMemAlloc(deviceInputCosts, a.length * Sizeof.INT + 1);
    cuMemcpyHtoD(deviceInputCosts, Pointer.to(costs), a.length * Sizeof.INT + 1);

    // Set up the kernel parameters: A pointer to an array
    // of pointers which points to the actual values
    Pointer kernelParameters = Pointer.to(
      Pointer.to(deviceInputA),
      Pointer.to(deviceInputB),
      Pointer.to(deviceInputCosts),
      Pointer.to(new int[]{a.length})
    );

    // Kernel call parameters
    int blockSizeX = 256;
    int gridSizeX = (int)Math.ceil((double)a.length / blockSizeX);

    // --------------------------------
    long startTime = System.currentTimeMillis();
    // --- Start of benchmark zone --->
    for(int i = 0; i < costs.length; i++) costs[i] = i;
    cuLaunchKernel(function,
      gridSizeX, 1, 1,       // Grid dimension
      blockSizeX, 1, 1,     // Block dimension
      0, null,              // Shared memory size and stream
      kernelParameters, null // Kernel and extra parameters
    );
    cuCtxSynchronize();
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
