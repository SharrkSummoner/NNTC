package com.yadren.mysqlsimple;

import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.*;
import javafx.scene.paint.Paint;
import javafx.scene.text.TextAlignment;

public class Controller {
    private int countViewProducts = 6; // Количество одновременно отоборажаем продуктов
    private int offsetProducts = 0;

    @FXML
    private ResourceBundle resources;

    @FXML
    private URL location;

    @FXML
    private TextField main_field;

    @FXML
    private TilePane productsPane;

    @FXML
    private Button buttonPrev;

    @FXML
    private Button buttonNext;

    // Объект на основен нашего класса для работы с БД
    DB db = null;

    @FXML
    void initialize() {

        // Инициируем объект
        db = new DB();
        // Вызов метод для подгрузки заданий внутрь программы
        loadInfo();
    }

    // Метод для подгрузки заданий внутрь программы
    void loadInfo() {
        try {
            // Удаляем прошлые данные
            productsPane.getChildren().clear();
            // Получаем новые данные из базы данных
            ArrayList<String[]> products = db.getProducts(countViewProducts, offsetProducts);
            for (int i = 0; i < products.size(); i++) { // Перебираем все через цикл
                String title = products.get(i)[0]; // Объявляем название
                int cost = Integer.parseInt(products.get(i)[1]); // Объявляем цену
                boolean isActive; // Объявляем состояние активности
                if (products.get(i)[2].equals("1")) // Если оно активно (равно = 1)
                    isActive = true; // Возвраещем true
                else
                    isActive = false; // Если неактивно, то false
                // Вызов метода getProductPane, передаем данные названия, цены и статуса активности
                Pane productPane = getProductPane(title, cost, isActive);
                // Доабвляем данные в объект VBox (all_tasks)
                productsPane.getChildren().add(productPane);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Метод для получения блока с продуктом
    public Pane getProductPane(String productTitle, int price, boolean isActive) {
        VBox productBox = new VBox();

        productBox.setPrefWidth(200); // Задаем ширину
        productBox.setPrefHeight(200); //Задаем высоту
        productBox.setStyle("-fx-border-style: solid;"
                + "-fx-border-width: 1;"
                + "-fx-border-color: white"); //Задаем стиль, вес и цвет
        productBox.setSpacing(5);

        Label titleLabel = new Label(productTitle);
        titleLabel.setAlignment(Pos.CENTER);
        titleLabel.setTextAlignment(TextAlignment.CENTER);
        titleLabel.setWrapText(true);

        productBox.getChildren().add(titleLabel);

        Label costLabel = new Label("Стоимость: " + price);
        productBox.getChildren().add(costLabel);
        Label isActiveLabel;
        if (isActive)
            isActiveLabel = new Label("В наличии");
        else
            isActiveLabel = new Label("Нет в наличии");
        productBox.getChildren().add(isActiveLabel);
        titleLabel.setTextFill(Paint.valueOf("#FFF"));
        costLabel.setTextFill(Paint.valueOf("#FFF"));
        isActiveLabel.setTextFill(Paint.valueOf("#FFF"));
        return productBox;
    }

    public void nextButtonClick(ActionEvent event) throws SQLException, ClassNotFoundException {
        if (db.getProducts(countViewProducts, offsetProducts + countViewProducts).size() > 0)
            offsetProducts += countViewProducts;
        productsPane.getChildren().clear();
        loadInfo();
    }

    public void prevButtonClick(ActionEvent event) {
        if (offsetProducts - countViewProducts >= 0)
            offsetProducts -= countViewProducts;
        productsPane.getChildren().clear();
        loadInfo();
    }
}


