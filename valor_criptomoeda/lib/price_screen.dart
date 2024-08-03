import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valor_criptomoeda/component/cryptoCard.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'BRL';

  void showAndroidPicker(BuildContext context) {
    showMaterialScrollPicker(
      title: 'Selecione uma moeda',
      context: context,
      items: currenciesList,
      selectedItem: selectedCurrency,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (int selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
        });
      },
      children: pickerItems,
    );
  }

  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (dataError) {
      print(dataError);
    }
  }

  Column makeCards(){
    List<CryptoCard> cryptoCards = [];
    for(String crypto in cryptoList){
      cryptoCards.add(
        CryptoCard(
          cryptoCurrency: crypto,
          selectedCurrency: selectedCurrency,
          value: isWaiting ? '?' : coinValues[crypto] ?? '?',
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('🪙')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          makeCards(),
          Container(
            height: 140.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Color(0xff000000),
            child: Platform.isIOS
                ? iOSPicker()
                : Container(
              height: 60.0,
                    width: screenWidth * 0.7,
                    child: ElevatedButton(
                      onPressed: () => showAndroidPicker(context),
                      child: Text(
                        selectedCurrency,
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
