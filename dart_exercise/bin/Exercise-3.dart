import 'dart:convert';
import 'dart:io';
import 'Cart.dart';
import 'ColorFunctions.dart';
import 'GetCurrentDateTime.dart';
import 'Product.dart';

void main(List<String> args) {
  //JSON
  List<Product> myProduct = [];

  // Read the JSON file
  File file = File('products.json');
  String jsonProducts = file.readAsStringSync();

  // Convert the JSON string to a list of products
  List<dynamic> productList = jsonDecode(jsonProducts);

  // Iterate over the product list and create Product objects
  for (var product in productList) {
    myProduct.add(Product(
      productId: product['productId'],
      productName: product['productName'],
      productPrice: product['productPrice'],
    ));
  }



  int customerNum = 1;
  String inputProductStatus;

  stdout.write("\x1B[37m >> INPUT PRODUCT INTO CART FOR INVOICE #$customerNum ? ( Yes / No) : \x1B[0m");

  inputProductStatus = stdin.readLineSync().toString();

  if(inputProductStatus.toUpperCase() == "YES"){

  }else if(inputProductStatus.toUpperCase() == "NO"){
    PrintCryan(YourText: "Thanks you ! Have A Great Day !");
  }else{
    PrintRed(YourText: " >> Wrong Choose ");/////// Write It At Home
  }

  for (int i = 0; i < customerNum; i++) {
    List<Cart> myCart = [];

    RandomProductIntoCart(myProduct: myProduct, myCart: myCart);

    print(Process.runSync("clear", [], runInShell: true).stdout);
    PrintWhite(YourText: "\n\n-------------------------------------------");
    PrintWhite(
        YourText:
            "BLUE TECHNOLOGY                 Invoice #\x1B[0m\x1B[31m0${i + 1}\x1B[0m");
    PrintWhite(YourText: "-------------------------------------------");

    PrintWhite(YourText: "Date : ${getMyCurrentDate}\n");
    ProductOutput(myProduct);
    CartOutput(myCart: myCart, Discount: 10);

    stdin.readLineSync();

    print(Process.runSync("clear", [], runInShell: true)
        .stdout); //This line for clear screen in console
  }
}

void ProductOutput(List<Product> myProduct) {
  PrintWhite(YourText: "Product :");
  PrintYellow(YourText: "No       Product        Price");
  PrintWhite(YourText: "=============================");

  for (int i = 0; i < myProduct.length; i++) {
    PrintYellow(
        YourText:
            "${myProduct[i].productId}        ${myProduct[i].productName}       ${myProduct[i].productPrice}﹩");
  }
}

void RandomProductIntoCart(
    {required List<Product> myProduct, required List<Cart> myCart}) {
  late int status;
  bool setDoWhile = true;
  int i = 0;
  bool st = true;
  String userInput = "";

  do {
    print(Process.runSync("clear", [], runInShell: true).stdout);
    ProductOutput(myProduct);
    // var randomNumber = Random().nextInt(5) + 1;
    stdout.write("\nEnter your product number : ");
    status = int.parse(stdin.readLineSync()!);

    if (status <= myProduct.length) {
      for (var product in myProduct) {
        if (product.productId == status) {
          i++;
          myCart.add(Cart(
              cartId: i,
              cartName: product.productName,
              cartPrice: product.productPrice));
          PrintGreen(
              YourText:
                  "${product.productName}, Product No.${product.productId}, has been added to your shopping cart.");

          // setDoWhile++;
          stdout.write("\x1B[37m >> Do you want to buy more products into your cart? (Yes/No) : \x1B[0m");
          userInput = stdin.readLineSync().toString();
          if(userInput.toUpperCase() == "YES"){
            setDoWhile = true;
          } else if(userInput.toUpperCase() == "NO"){
            setDoWhile = false;
          } else {
            PrintRed(YourText: " >> Choose ( Yes / No ) !!! \nPress Enter To Continue......");
            stdin.readLineSync();
          }
          
          
        }
      }
    } else {
      PrintRed(YourText: "PRODUCT No. '$status' NOT AVAILABLE IN THE LIST !!!");
      stdin.readLineSync();
    }
  } while (setDoWhile);
}

void CartOutput({required List<Cart> myCart, double Discount = 10}) {
  double subTotal = 0;

  double getDiscount = 0;

  double getTotal = 0;
  PrintWhite(YourText: "\nCart :");
  PrintGreen(YourText: "No       Product        Price");
  PrintWhite(YourText: "=============================");
  for (int i = 0; i < myCart.length; i++) {
    PrintGreen(
        YourText:
            "${myCart[i].cartId}        ${myCart[i].cartName}       ${myCart[i].cartPrice}﹩");
    subTotal += myCart[i].cartPrice;
  }
  getDiscount = subTotal * Discount / 100;
  getTotal = subTotal - getDiscount;

  PrintWhite(YourText: "-------------------------------------------");
  PrintWhite(YourText: "Sub Total : ${subTotal.toStringAsFixed(2)}﹩");
  PrintWhite(YourText: "Discount  : $Discount %");
  PrintWhite(YourText: "Total     : ${getTotal.toStringAsFixed(2)}﹩");

}
