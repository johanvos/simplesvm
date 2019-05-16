import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Stage;


public class HelloFX extends Application {

    public HelloFX() {
    }

    @Override
    public void start(Stage stage) {
        System.err.println("[JVDBG] APPLICATION HELLOFX start");
System.err.println("A0");
        String jfxversion = System.getProperty("javafx.version");
System.err.println("A1");
        String version = System.getProperty("java.version");
        Label l = new Label ("Hello, JavaFX "+jfxversion+", running on Java "+version);
System.err.println("A2");
        Scene scene = new Scene (l, 640, 480);
System.err.println("A3");
        stage.setScene(scene);
System.err.println("A4");
        stage.show();
System.err.println("A5");
    }

    public static void main(String[] args) {
        System.setProperty("os.target", "ios");
        System.setProperty("os.name", "iOS");
        System.setProperty("glass.platform", "ios");
        System.setProperty("javafx.verbose", "true");
        System.setProperty("prism.verbose", "true");
        launch();
    }

}
