class Data {
  //List stocks = [];
  liveData livedata;
  Data.fromJson(Map<String, dynamic> json)
      : livedata = liveData.fromJson(json['live_data']);
}

class liveData {
  var symbol, ltp;
  liveData.fromJson(Map<String, dynamic> json)
      : symbol = json['symbol'],
        ltp = json['ltp'];
}
