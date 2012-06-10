#library("qalqo:dartgap:testapp");

#import("dart:html");
#import("../lib.dart");

main() {
  dartgap.onDeviceReady = ((Device device) {
    // device API
    device.info.then((DeviceInfo deviceInfo) {
      _addHtml(""" 
        <article id='info'>
          <h2>Dart is running on:</h2>
          <ul>
            <li>Platform: ${deviceInfo.platform}</li>   
            <li>Device version: ${deviceInfo.deviceVersion}</li>
            <li>Cordova version: ${deviceInfo.cordovaVersion}</li>
            <li>UUID: ${deviceInfo.uuid}</li>   
            <li>Name: ${deviceInfo.name}</li>
            <li>Color depth: ${deviceInfo.screen.colorDepth}</li>   
            <li>Height: ${deviceInfo.screen.height}</li>
            <li>Width: ${deviceInfo.screen.width}</li>
          </ul>
        </article>
      """);
    });
    
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
   
    // notification API
    device.notification.alert("Dart says hello");
  });
}

_addHtmlTo(String html, Element target) => target.nodes.add(new Element.html(html));

_addHtml(String html) => _addHtmlTo(html, document.body);











