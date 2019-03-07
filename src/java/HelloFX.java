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
        String version = System.getProperty("java.version");
        Label l = new Label ("Hello, JavaFX 11, running on "+version);
        Scene scene = new Scene (l, 640, 480);
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        System.setProperty("os.target", "ios");
        System.setProperty("javafx.verbose", "true");
        System.setProperty("prism.verbose", "true");
        launch();
    }

}
