/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

/**
 *
 * @author chang
 */
public class Formatear {
    public String formatear(String desformateado){
    String formateado = "";
    String valorSinPunto = desformateado.replaceAll("\\.", "");
    String valorSinE9 = valorSinPunto.replaceAll("E9", "");
        switch (valorSinE9.length()) {
            case 10:
                formateado = valorSinE9;
                break;
            case 9:
                formateado = valorSinE9 + "0";
                break;
            case 8:
                formateado = valorSinE9 + "00";
                break;
            case 7:
                formateado = valorSinE9 + "000";
                break;
            case 6:
                formateado = valorSinE9 + "0000";
                break;
            default:
                break;
        }
    
    return formateado;
}
    public static void main(String[] args) {
        Formatear formato = new Formatear();
        String uno = formato.formatear("2.021090087E9");
        String dos = formato.formatear("2.02109008E9");
        String tres = formato.formatear("2.0210901E9");
        String cuatro = formato.formatear("2.021091E9");
        System.out.println(uno);
        System.out.println(dos);
        System.out.println(tres);
        System.out.println(cuatro);
    }
}
