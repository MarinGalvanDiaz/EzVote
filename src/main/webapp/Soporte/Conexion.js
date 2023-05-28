/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var mysql = require('mysql2');
var con = mysql.createConnection({
    host:'127.0.0.1',
    port: '3306',
    user:'root',
    password:'n0m3l0',
    database:'Fondo_financiero4'
});
con.connect(function(error){
    if(error){
        console.log(error);
    }else{
        con.query("SELECT Descripcion,Respuesta FROM Reporte WHERE IdReporte = 1",function(error,results,fields){
            if(error){
                console.log(error);
            }else{
                results.forEach(result=>{
                    console.log(result);
                    
                });
                console.log("La respuesta es: "+results[0].Respuesta);
            }
        });
    }
});
