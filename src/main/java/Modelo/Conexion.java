/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author alumno
 */
public class Conexion {
     public Connection conectar(){
        Connection cn = null;
        try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           cn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/EzVote?autoReconnect=true&useSSL=false", "root", "n0m3l0");
        }
        catch(Exception e){
            System.out.println("Error al conectar" + e.getMessage());
        }
        return cn;
    } //© Copyright 2023 Speed Experience. Todos los derechos reservados
}
