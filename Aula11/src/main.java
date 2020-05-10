import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class main {
    public static void main(String[] args) {

        Scanner myObj = new Scanner(System.in);


        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
        while (true) {
            System.out.println("Data de nascimento (e.g 12-02-1996): ");
            String str = myObj.nextLine();
            try {
                Date date = sdf.parse(str);
                //System.out.println(date);
                break;
            } catch (ParseException e) {
                System.out.println("Data inválida. Tende de novo.");
            }
        }

        while (true) {
            System.out.println("Nome:");
            String name= myObj.nextLine();
            if (name.length() < 3){
                System.out.println("Nome muito curto!");
                continue;
            }
            else if (!name.matches("[a-zA-Z\\s]+")){
                System.out.println("Apenas letras!");
                continue;
            }
            else {
                break;
            }
        }

        while (true) {
            System.out.println("Número de identificação fiscal (NIF):");
            String name= myObj.nextLine();
            if (name.length() != 9){
                System.out.println("Número inválido! Tente outra vez.");
                continue;
            }
            else if (!name.matches("[0-9]+")){
                System.out.println("Apenas números! Tente outra vez.");
                continue;
            }
            else {
                break;
            }
        }

        while (true) {
            System.out.println("Número de identificação de cidadão (NIC):");
            String name = myObj.nextLine();
            if (name.length() != 8) {
                System.out.println("Número inválido! Tente outra vez.");
                continue;
            } else if (!name.matches("[0-9]+")) {
                System.out.println("Apenas números! Tente outra vez.");
                continue;
            } else {
                break;
            }
        }
        while (true) {
            System.out.println("Numero de cartão de crédito:");
            String name = myObj.nextLine();
            if (name.length() != 16) {
                System.out.println("Número inválido! Tente outra vez.");
                continue;
            } else if (!name.matches("[0-9]+")) {
                System.out.println("Apenas números! Tente outra vez.");
                continue;
            } else {
                break;
            }
        }

        SimpleDateFormat sd = new SimpleDateFormat("dd-yyyy");
        while (true) {
            System.out.println("Validade do cartão de crédito (e.g 02-2019): ");
            String st = myObj.nextLine();
            try {
                Date validade = sd.parse(st);
                //System.out.println(date);
                break;
            } catch (ParseException e) {
                System.out.println("Data inválida. Tende de novo.");
            }
        }

        while (true) {
            System.out.println("CVC/CVV do cartão de crédito:");
            String name = myObj.nextLine();
            if (name.length() != 3) {
                System.out.println("Número inválido! Tente outra vez.");
                continue;
            } else if (!name.matches("[0-9]+")) {
                System.out.println("Apenas números! Tente outra vez.");
                continue;
            } else {
                break;
            }
        }

        System.out.println("Valor a pagar: ");
        while (!myObj.hasNextDouble()){
            System.out.println("Valor incorreto. Tente de novo");
            myObj.next();
        }
        double valor = myObj.nextDouble();

        System.out.println("Obrigado!");




    }
}
