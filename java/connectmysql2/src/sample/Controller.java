package sample;

import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;

import javax.net.ssl.SNIHostName;

public class Controller {

    private int countViewProducts = 6; // Количество одновременно отоборажаем продуктов
    private int offsetProducts = 0;


    @FXML
    private ResourceBundle resources;

    @FXML
    private URL location;

    @FXML
    private TextField text_field;

    @FXML
    private VBox all_tasks;

    // Объект на основен нашего класса для работы с БД
    DB db = null;

    @FXML
    void initialize() {
        db = new DB();
        loadInfo();
    }


    void loadInfo() {
        try {
            // Сначала очищаем от прошлых значений
            all_tasks.getChildren().clear();

            // Получаем все задания из базы данных
            ArrayList<String> taskTitle = db.getTasks("Title");
            ArrayList<String> taskCost = db.getTasks("Cost");
            ArrayList<String> taskDiscount = db.getTasks("Discount");

            all_tasks.setSpacing(5);

            for (int i = 0; i < taskTitle.size(); i++) {
                VBox vbox = new VBox();
                vbox.setStyle("-fx-border-style: solid;" + "-fx-border-width: 1;" + "-fx-border-color: white");
                if (taskDiscount.get(i).equals("0.0")) {
                    Label labelTitle = new Label(taskTitle.get(i));
                    Label labelCost = new Label(taskCost.get(i) + " рублей");

                    vbox.getChildren().add(labelTitle);
                    vbox.getChildren().add(labelCost);
                } else {
                    HBox hBox = new HBox();
                    hBox.setSpacing(4);

                    Label labelTitle = new Label(taskTitle.get(i));
                    Label labelCost = new Label(taskCost.get(i));

                    Double doubleCost = Double.parseDouble(taskCost.get(i));
                    Double doubleDiscount = Double.parseDouble(taskDiscount.get(i));

                    Label labelDiscCost = new Label(String.valueOf(
                            doubleCost - (doubleCost * doubleDiscount)) + " рублей");
                    Label labelDiscount = new Label("* скидка " + Double.parseDouble(taskDiscount.get(i)) * 100 + "%");

                    labelCost.getStylesheets().addAll(getClass().getResource(
                            "strikethrough.css"
                    ).toExternalForm());

                    hBox.getChildren().add(labelCost);
                    hBox.getChildren().add(labelDiscCost);

                    vbox.getChildren().add(labelTitle);
                    vbox.getChildren().add(hBox);
                    vbox.getChildren().add(labelDiscount);
                }
                all_tasks.getChildren().add(vbox);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}