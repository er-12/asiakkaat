package perusteita;

import java.util.Scanner;
import java.text.DecimalFormat;

public class Lahjavero {
	
	public double laskeVero(double arvo) {
		double vero = 0.0;
		if (arvo < 5000) {
            vero = 0.0;
        } else if (arvo <= 25000) {
            vero = 100 + (arvo - 5000) * 0.08;
        } else if (arvo <= 55000) {
            vero = 1700 + (arvo - 25000) * 0.1;
        } else if (arvo <= 200000) {
            vero = 4700 + (arvo - 55000) * 0.12;
        } else if (arvo <= 1000000) {
            vero = 22100 + (arvo - 200000) * 0.15;
        } else if (arvo > 1000000) {
            vero = 142100 + (arvo - 1000000) * 0.17;
        }
		return vero;
	}
	public static void main(String[] args) {
		Lahjavero ohjelma = new Lahjavero();
		Scanner input = new Scanner(System.in);
		DecimalFormat des = new DecimalFormat("0.00");
		System.out.print("Anna lahjan suuruus: ");
		double arvo = input.nextDouble();
		double vero = ohjelma.laskeVero(arvo);
		System.out.print("Lahjavero on " + des.format(vero) + " euroa");
	}

}
