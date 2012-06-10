#library("qalqo:dartgap:testapp");

#import("dart:html");
#import("../lib.dart");

main() {
  dartgap.onDeviceReady = ((Device device) {
    _addHtml("<h1>Hey, it's Dart!</h1>");
    
    // database API
    device.openDatabase("testdb", "1.0", "TestDB", 10000).then((DeviceDatabase db) {
      Future<SQLBatchResult> batchCallback = db.batchSql("DROP TABLE IF EXISTS USERS").
         batchSql("CREATE TABLE IF NOT EXISTS USERS (id unique, username unique)").
         batchSql("INSERT INTO USERS (id, username) VALUES (1, 'Bob')").
         batchSql("INSERT INTO USERS (id, username) VALUES (2, 'Seth')").
         batchSql("SELECT * FROM USERS").
         executeBatch(); 
      
      batchCallback.then((SQLBatchResult result) {
        _addHtml("<h2>Dart talked to the Device Database!</h2>");
        result[4].forEach((Map data) {
          String id = data["id"];
          String username = data["username"];
          _addHtml("<p>User ${id}: ${username}</p>");
        });
      });
      batchCallback.handleException((Exception e) => print("error is $e"));
    });
    
    // device API
    //-- TODO convert this into a Dart template 
    device.info.then((DeviceInfo deviceInfo) {
      _addHtml(""" 
        <article id='info'>
        <h4>
          Platform: <span id='platform'>${deviceInfo.platform}</span>   
          Device version: <span id='version'>${deviceInfo.deviceVersion}</span>
          Cordova version: <span id='version'>${deviceInfo.cordovaVersion}</span>
        </h4>
        <h4>
          UUID: <span id='uuid'>${deviceInfo.uuid}</span>   
          Name: <span id='name'>${deviceInfo.name}</span>
        </h4>
        <h4>
          Color depth: <span id='colorDepth'>${deviceInfo.screen.colorDepth}</span>
          Height: <span id='height'>${deviceInfo.screen.height}</span>, 
          Width: <span id='width'>${deviceInfo.screen.width};</span>,   
        </h4>
        </article>
      """);
    });
   
    // notification API
    device.notification.alert("Dart says hello");
  });
}

_addHtmlTo(String html, Element target) => target.nodes.add(new Element.html(html));

_addHtml(String html) => _addHtmlTo(html, document.body);











