import java.util.*;

class Collartz {
    public static void main(String[] args){
        System.out.println("Please enter the range: \n");
        Scanner input = new Scanner(System.in);
        int range = input.nextInt();
        while (range > 1){
            if (range%2 == 0){
                range /= 2;
                System.out.println(range);
            }else{
                range = (3*range) + 1;
                System.out.println(range);
            }
        }
    }
}
