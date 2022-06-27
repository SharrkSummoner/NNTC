import java.util.Scanner;

class zadacha_1 {

    public static void main(String[] args) {

        int numbersArray[] = new int[3];
        int sum = 0;

        Scanner sc = new Scanner(System.in);
        System.out.print("Введите три чиcла (черех пробел): ");

        for (int i = 0; i < numbersArray.length; i++) {
            if (!sc.hasNextInt())
                System.out.println("Извините, но это явно не число. Перезапустите программу и попробуйте снова!");
            numbersArray[i] = sc.nextInt();
        }

        numbersArray[0] *= 2;
        numbersArray[1] -= 3;
        numbersArray[2] *= numbersArray[2];

        for (int i = 0; i < numbersArray.length; i++) {
            sum += numbersArray[i];
        }

        System.out.println("Полученная сумма чисел: " + sum);
    }
}
