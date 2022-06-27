import java.util.Scanner;

class zadacha_5 {
    public static void main(String args[]) {
        int randomNumber = (int) (Math.random() * 20 + 1),
                attempts = 10, inputNumber = 0;
        System.out.println("Угадайте число от 1 до 20. У вас 10 попыток.");

        Scanner sc = new Scanner(System.in);

        while (attempts > 0) {
            System.out.print("\nВведите число: ");
            inputNumber = sc.nextInt();

            if (inputNumber > 20 || inputNumber < 0) {
                System.out.println("Число не соответствует условию.");
                continue;
            }

            if (inputNumber == randomNumber) {
                System.out.println("\nВы угадали!");
                break;
            }

            System.out.println("\nК сожалению, вы не угадали :(");

            if (inputNumber > randomNumber) {
                System.out.println("Подсказка! Загаданное число меньше ;)");
            } else {
                System.out.println("Подсказка! Загаданное число больше ;)");
            }
            attempts--;
            System.out.println("У вас осталось " + attempts + " попыток.");
        }
    }
}
