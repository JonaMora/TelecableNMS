/**
 *
 * @author Jonathan Mora
 */
public class Url {
    private String home;
    private String bienvenido;
    private String mapa;
    
    public Url(){
        home = "index.html";
        bienvenido = "bienvenido.jsp";
        mapa = "https://www.google.com/maps/d/edit?mid=1pSGMZ0c1RCpaJXt1FFVcP6s9JJQ&ll=19.697502880828257%2C-101.1921461&z=12";
    }
    
    public String home(){
        return home;
    }
    
    public String bienvenido(){
        return bienvenido;
    }
    
    public String mapa(){
        return mapa;
    }
}
