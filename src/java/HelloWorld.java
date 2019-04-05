public class HelloWorld {

    public static void main(String[] args) {
        System.err.println("hello, world");
        Thread t = new Thread() {
            @Override public void run() {
                System.err.println("Running in a new thread");
            }
        };
        t.start();
        try {
            System.err.println("Started new thread, main thread will sleep 10 seconds now");
            Thread.sleep(10000);
            System.err.println("Started new thread, main thread did sleep 10 seconds");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

}
