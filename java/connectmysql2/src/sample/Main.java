package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Stage;

public class Main extends Application {


    @Override
    public void start(Stage primaryStage) throws Exception {
        Parent root = FXMLLoader.load(getClass().getResource("sample.fxml"));
        primaryStage.setTitle("Список услуг");
        primaryStage.setScene(new Scene(root, 500, 400));
        primaryStage.show();

        javafx.scene.control.Label strikethrough = new Label("Strikethrough");
        strikethrough.getStylesheets().addAll(getClass().getResource(
                "strikethrough.css"
        ).toExternalForm());
    }


    public static void main(String[] args) {
        launch(args);
    }
}
