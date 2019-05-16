import java.util.logging.*;
import java.io.*;

public class HelloWorld {

    public static void main(String[] args) throws Exception  {
        System.err.println("Hello, world, in main");
String os = System.getProperty("os.name");
System.err.println("os = "+os);
System.setProperty("os.name","iOS");
String os2 = System.getProperty("os.name");
System.err.println("os2 = "+os2);
File f = new File("/Users/johan/ftt");
String[] cc = f.list();
for (String c: cc) {
System.err.println("FILE -> "+c);
}
System.load("/Users/johan/dooh");
System.err.println("SCL = "+ClassLoader.getSystemClassLoader());
System.err.println("PCL = "+ClassLoader.getPlatformClassLoader());
Thread.dumpStack();
        Thread t = new Thread() {
            @Override public void run() {
                System.err.println("Running in a new thread");
            }
        };
        t.start();
 Logger l = Logger.getLogger(HelloWorld.class.getName());
               System.err.println("Hello, world");
                System.Logger syslog = System.getLogger("foo");
                syslog.log(System.Logger.Level.INFO, "Hello, syslog");
       l.info("Hello, normal log");

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
