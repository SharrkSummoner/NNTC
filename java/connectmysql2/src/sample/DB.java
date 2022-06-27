package sample;

import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

public class DB {

    // Данные для подключения к локальной базе данных
    private final String HOST = "localhost";
    private final String PORT = "3306";
    private final String DB_NAME = "demoex_2019";
    private final String LOGIN = "root";
    private final String PASS = "";// Если OpenServer, то здесь mysql напишите

    private static Connection dbConn = null;

    // Метод для подключения к БД с использованием значений выше
    private Connection getDbConnection() throws ClassNotFoundException, SQLException {
        String connStr = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB_NAME;
        Class.forName("com.mysql.cj.jdbc.Driver");

        dbConn = DriverManager.getConnection(connStr, LOGIN, PASS);
        return dbConn;
    }


    public ArrayList<String> getTasks(String a) throws SQLException, ClassNotFoundException {
        String sql = "SELECT " + a + " FROM Service ORDER BY `id` DESC";

        Statement statement = getDbConnection().createStatement();
        ResultSet res = statement.executeQuery(sql);

        ArrayList<String> tasks = new ArrayList<>();
        while (res.next()) {
            tasks.add(res.getString(a));
        }
        return tasks;
    }

    public ArrayList<String[]> getProducts(int limit, int offset) throws SQLException, ClassNotFoundException {
        String sql = "SELECT Title, Cost, isActive FROM Product LIMIT " + limit + " OFFSET " + offset;

        Statement statement = getDbConnection().createStatement();
        ResultSet res = statement.executeQuery(sql);

        ArrayList<String[]> products = new ArrayList<String[]>();
        while (res.next()) {
            String title = res.getString("Title");
            String cost = String.valueOf(res.getFloat("Cost"));
            String isActive = res.getString("isActive");

            products.add(new String[]{title, cost, isActive});
        }

        return products;
    }

}