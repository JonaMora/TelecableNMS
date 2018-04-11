/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pruebas;

import java.util.List;
import java.util.Map;
import me.legrange.mikrotik.*;

/**
 *
 * @author ROBBEN
 */
public class pruebas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try{
            try (ApiConnection con = ApiConnection.connect("192.168.13.215") // connect to router
            ) {
                con.login("admin",""); // log in to router
                //con.execute("/system/reboot"); // execute a command                                   
                
                
                //PPOE
                //INSERTAR
                //con.execute("/ppp/secret/add name=25569 password=0123456789ab profile=10MpppVLAN62 service=pppoe");
                
                //MODIFICAR
                //con.execute("/ppp/secret/set disabled=false where name=automatico3");//NO FUNCIONA
                //con.execute("/ppp/secret/set .id=*11 disabled=true");
                
                
                
                //ELIMINAR
                //con.execute("/ppp/secret/remove .id=*4");
                
                //LEER
                List<Map<String, String>> rs = con.execute("/ppp/secret/print");
                rs.forEach((r) -> {
                    System.out.print("NOMBRE PPP: " + r.get("name") + 
                            " // PASSWORD: " + r.get("password") +
                            " // PROFILE: " + r.get("profile") +
                            " // DISABLED: " + r.get("disabled") +
                            " // LAST LOGGED: " + r.get("last-logged-out") +
                            " // ID: " + r.get(".id") +
                            "\n");
                });//PPOE
                
                
                //LEER DHCP                
                
                //HACER ESTATICA
                //con.execute("/ip/dhcp-server/lease/make-static .id=*8");//HACER ESTATICO
                //con.execute("/ip/dhcp-server/lease/set .id=*8 rate-limit=10M/10M  comment=CONTRATO");//ASIGNAR ANCHO DE BANDA
                
                //MODIFICAR                
                //con.execute("/ip/dhcp-server/lease/set .id=*8 rate-limit=2M/2M");//MODIFICAR ANCHO DE BANDA
                
                //ELIMINAR                
                //con.execute("/ip/dhcp-server/lease/remove .id=*6");//ELIMINAR
                
                /*List<Map<String, String>> rs = con.execute("/ip/dhcp-server/lease/print");
                rs.forEach((r) -> {
                    System.out.print("RATE: " + r.get("rate-limit") + 
                            " // DYNAMIC: " + r.get("dynamic") +
                            " // MAC: " + r.get("mac-address") +
                            " // ADDRESS: " + r.get("address") +
                            " // HOST: " + r.get("host-name") +
                            " // STATUS: " + r.get("status") +
                            " // ID: " + r.get(".id") +
                            "\n");
                });*///DHCP
                
                //con.close();// disconnect from router
            } // log in to router
            //con.execute("/system/reboot"); // execute a command
        }
        catch(MikrotikApiException e){System.out.println(e);}
    }
    
}
