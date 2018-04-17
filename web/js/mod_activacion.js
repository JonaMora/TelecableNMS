var macd = "";
function validateForm() {
    var ip = document.forms["myForm"]["ipaddres"].value;
    var mac = document.forms["myForm"]["mac"].value;
    var serie = document.forms["myForm"]["no_serie"].value;
    var contrato = document.forms["myForm"]["contrato"].value;
    var paquete = document.forms["myForm"]["paquete"].value;
    var empresa = document.forms["myForm"]["empresa"].value;
    this.macd = mac;
    
    var result = confirm("IP: "+ ip + "\n" + 
            "Mac: " + mac + "\n" + 
            "No. Serie: " + serie + "\n" +
            "Contrato: " + contrato + "\n" +
            "Paquete: " + paquete + "\n" + 
            "Empresa: "  + empresa + "\n" + 
            "¿Los datos son correctos?");
    
    if (result) {
        return true;
    } else {
        return false;
    }

}
function confirmacion_alta_ont() {
    alert("La alta del equipo con la mac: " + this.macd + " se realizo con exito");
    setTimeout("location.href='../../bienvenido.jsp'", 0.1);
}




