/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

/**
 *
 * @author chang
 */
import java.util.Random;

public class GeneradorContraseñas {
    private static final String CARACTERES_PERMITIDOS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";

    public String generarContraseña(int longitud) {
        StringBuilder contraseña = new StringBuilder();
        Random random = new Random();
        
        for (int i = 0; i < longitud; i++) {
            int index = random.nextInt(CARACTERES_PERMITIDOS.length());
            char caracter = CARACTERES_PERMITIDOS.charAt(index);
            contraseña.append(caracter);
        }
        
        return contraseña.toString();
    }

    /*public static void main(String[] args) {
        int longitudContraseña = 10; // Longitud deseada para la contraseña
        String contraseñaGenerada = generarContraseña(longitudContraseña);
        System.out.println("Contraseña generada: " + contraseñaGenerada);
    }*/
}