class zadacha_2 {
    public static void main(String args[]) {
        int numbersArray[] = new int[10];
        int sum = 0;

        boolean isEven = false;

        for (int i = 0; i < numbersArray.length; i++) {
            numbersArray[i] = (int) (Math.random() * 21);
            System.out.print(numbersArray[i] + " ");
        }

        for (int i = 0; i < numbersArray.length; i++) {
            if ((numbersArray[i] % 2) != 0) {
                sum += numbersArray[i];
            } else {
                isEven = true;
                break;
            }
        }

        if (!isEven) {
            sum = 0;
            for (int i = 1; i < numbersArray.length - 1; i++) {
                sum += numbersArray[i];
            }
        }

        System.out.println("\nСумма чисел: " + sum);
    }
}
