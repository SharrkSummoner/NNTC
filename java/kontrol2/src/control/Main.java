package control;

import entities.Lecture;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Main {

    public static void main(String[] args) throws IOException {

        //Создаем объект File
        File file = new File("test.txt");
        //Создаем новый файл
        try {
            file.createNewFile();
        } catch (Exception e) {
            System.out.println("Не удалось создать файл");
        }

        //Создаем объект FileWrite
        FileWriter wr = new FileWriter(file);

        //Создание объекта класса Lecture
        Lecture lc = new Lecture("Пакеты и интерфейсы", "26.03.2022", "453", "15:00", "3ИСиП-19-1");

        System.out.println("Вызов метода create");
        lc.create();
        try {
            wr.write(String.valueOf("create()"+ '\n'+
                    "name: "+lc.name+'\n'+
                    "data: "+lc.data+'\n'+
                    "aud: "+lc.aud+'\n'+
                    "time: "+lc.time+'\n'+
                    "group: "+lc.group+'\n'+'\n'));
        } catch (Exception e) {
            System.out.println("Не удалось записать данные в файл");
        }

        System.out.println();

        System.out.println("Вызов метода removeLek");
        lc.removeLek();
        System.out.println();

        System.out.println("Вызов метода getInfo");
        lc.getInfo();
        System.out.println();

        System.out.println("Вызов метода setInfo");
        lc.setInfo( "Пакеты и интерфейсы", "27.03.2022", "453", "10:00", "3ИСиП-19-2");
        try {
            wr.write(String.valueOf("setInfo()"+ '\n'+
                    "name: "+lc.name+'\n'+
                    "data: "+lc.data+'\n'+
                    "aud: "+lc.aud+'\n'+
                    "time: "+lc.time+'\n'+
                    "group: "+lc.group+'\n'+'\n'));
        } catch (Exception e) {
            System.out.println("Не удалось записать данные в файл");
        }

        System.out.println();

        System.out.println("Вызов метода getInfo");
        lc.getInfo();
        System.out.println();

        System.out.println("Вызов метода copy");
        //Создание копии объекта lc класса Lecture
        Lecture lc2 = lc.copy();
        try {
            wr.write(String.valueOf("copy()"+ '\n'+
                    "name: "+lc.name+'\n'+
                    "data: "+lc.data+'\n'+
                    "aud: "+lc.aud+'\n'+
                    "time: "+lc.time+'\n'+
                    "group: "+lc.group+'\n'+'\n'));
        } catch (Exception e) {
            System.out.println("Не удалось записать данные в файл");
        }

        System.out.println();

        System.out.println("Вызов метода getInfo для копии объекта");
        lc2.getInfo();
        System.out.println();

        wr.flush();
        wr.close();
    }
}
