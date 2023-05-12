/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author alumno
 */
public class VerifUsuarios {

    public Usuarios identificar(Usuarios user) throws Exception {
        Usuarios usu = null;
        Conexion con;
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql2 = "SELECT * FROM Usuarios WHERE identificador = (?) AND contrasenia = (?);";

        con = new Conexion();
        try {
            cn = con.conectar();
            ps = cn.prepareStatement(sql2);
            ps.setString(1, user.getIdentificador());
            ps.setString(2, user.getContrasenia());

            rs = ps.executeQuery();
            if (rs.next() == true) {
                usu = new Usuarios();
                usu.setId(rs.getInt(1));
                usu.setIdentificador(user.getIdentificador());
                usu.setContrasenia(user.getContrasenia());
                usu.setEmail(rs.getString(4));
                usu.setCargo(rs.getInt(5));
                usu.setEstado(rs.getInt(6));
                System.out.println("Encontrado");
            } else {
                System.out.println("algo tamal");

            }
        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (ps != null && ps.isClosed() == false) {
                ps.close();
            }
            ps = null;
            if (cn != null && cn.isClosed() == false) {
                cn.close();
            }
            cn = null;
        }
        return usu;
    }
}
