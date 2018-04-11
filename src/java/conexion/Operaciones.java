/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import javax.naming.spi.DirStateFactory;

/**
 *
 * @author Jonathan Mora
 */
public class Operaciones {
    String driver;
    String url;
    String usuario;
    String password;
    
    public Operaciones() {
        driver = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://127.0.0.1/prueba";
        usuario = "root";
        password = "";
    }
    
    public String[] loguear(String usuario, String pass) throws ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = null;
        Statement sql = null;
        String[] fila = null;
        // Realizamos consulta en primera tabla
        String consulta = "SELECT * FROM `login` WHERE nick='" + usuario + "' AND pass='" + pass + "'";
        try {
            Vector vec = new Vector();
            Class.forName("com.mysql.jdbc.Driver");
            conexion = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1/prueba", "root", "");
            sql = conexion.createStatement();
            ResultSet rs = sql.executeQuery(consulta);
            ResultSetMetaData rm = rs.getMetaData();
            int numColmnas = rm.getColumnCount();
            String[] tituColumnas = new String[numColmnas];
            for (int i = 0; i < numColmnas; i++) {
                tituColumnas[i] = rm.getColumnName(i + 1);
            }

            vec.add(tituColumnas);
            while (rs.next() == true) {
                String[] reglon = new String[numColmnas];
                for (int i = 0; i < numColmnas; i++) {
                    reglon[i] = rs.getString(i + 1);
                }
                vec.add(reglon);
                if (vec != null) {
                    if (vec.size() > 1) {
                        fila = (String[]) vec.get(1);
                    }
                }
            }
            return fila;
        } catch (Exception e) {
            return fila;
        }
    }
}
