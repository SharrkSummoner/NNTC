package entities;

public class Lecture {
    //Объявление полей класса
    public String name;
    public String data;
    public String aud;
    public String time;
    public String group;

    //Конструктор класса
    public Lecture (String name, String data, String aud, String time, String group) {
        this.name = name;
        this.data = data;
        this.aud = aud;
        this.time = time;
        this.group = group;
    }

    //Метод создание лекции
    public void create() {
        System.out.printf("Создание лекции \"%s\"\n", name);
    }

    //Метод удаление всех данных о лекции
    public void removeLek() {
        System.out.printf("Удаление лекции \"%s\"\n", name);
        this.name = null;
        this.data = null;
        this.aud = null;
        this.time = null;
        this.group = null;
    }

    //Метод получения данных о лекции
    public void getInfo() {
        System.out.printf("Название лекции: \"%s\"\n", name);
        System.out.printf("Дата проведения: \"%s\"\n", data);
        System.out.printf("Аудитория: \"%s\"\n", aud);
        System.out.printf("Время проведения: \"%s\"\n", time);
        System.out.printf("Группа: \"%s\"\n", group);
    }

    //Метод измнения данных о лекции
    public void setInfo(String name, String data, String aud, String time, String group) {
            this.name = name;
            this.data = data;
            this.aud = aud;
            this.time = time;
            this.group = group;
    }

    //Метод получения полной копии объекта
    public Lecture copy() {
        return Lecture.this;
    }
}
