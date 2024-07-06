/*
**********Project Name: nutrimd
**********File Name: api_connection
**********Created At: 15-Apr-24 10:27 PM
**********Author: Abdelrhman Hussein
**********Description: This page to manage the api code.
*/

class ApiConnections {
  //192.168.199.119 //// 10.0.2.2:80 //// 192.168.1.9:80
  // static String urlBase = "192.168.199.119:80";
  // chatbot base url = 192.168.1.23:5000
  static String backendUrlBase = "192.168.93.119:80", aiUrlBase = "192.168.93.113:5000", maxSensorBase = "192.168.93.173", qrSensorBase = "192.168.93.92";
  Map<String, String> urlDomains = {
    "signIn": "nutrimd_php/authentication/sign_in.php",
    "signUp": "nutrimd_php/authentication/sign_up.php",
    "medicalResults": "nutrimd_php/enter_data/medical_data.php",
    "physicalResults": "nutrimd_php/enter_data/physical_data.php",
    "userDiseases": "nutrimd_php/enter_data/disease.php",
    "userDiet": "nutrimd_php/enter_data/diet.php",
    "scanProduct": "nutrimd_php/product/scan.php",
    "useProduct": "nutrimd_php/product/use_product.php",
    "buyProduct": "nutrimd_php/product/buy_product.php",
    "buyedProduct": "nutrimd_php/product/buyed_product.php",

    "chatbot": "chatbot",
    "recommendation": "recommend",
    "restriction": "check",

    "qrSensor": "qrscanner.php/",
  };
}
