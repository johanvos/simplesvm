import javafx.application.Application;
import javafx.scene.*;
import javafx.scene.control.*;
import javafx.stage.*;
import javafx.stage.Stage;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.StackPane;


public class HelloFX extends Application {

    public HelloFX() {
    }

    @Override
    public void start(Stage stage) {
        System.err.println("[JVDBG] APPLICATION HELLOFX start");
System.err.println("A0");
Image im = new Image (HelloFX.class.getResourceAsStream("/openduke.png"));
ImageView iv = new ImageView(im);
        String jfxversion = System.getProperty("javafx.version");
System.err.println("A1");
        String version = System.getProperty("java.version");
        Label l = new Label ("Hello, JavaFX "+jfxversion+", running on Java "+version);
System.err.println("A2");
        Scene scene = new Scene (new StackPane(createNode()), 640, 480);
System.err.println("A3");
        stage.setScene(scene);
System.err.println("A4");
        stage.show();
System.err.println("A5");
    }

    Node createNode() {
Button button = new Button("Click me");
        button.setOnAction(e -> {
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Information Dialog");
            alert.setHeaderText("An Information Dialog");
            alert.setContentText("The message");

            alert.showAndWait();
        });
    return button;
} 

    public static void main(String[] args) {
        // System.setProperty("os.target", "ios");
        // System.setProperty("os.name", "iOS");
        // System.setProperty("glass.platform", "ios");
        System.setProperty("javafx.verbose", "true");
        System.setProperty("prism.verbose", "true");
        launch();
    }

}
