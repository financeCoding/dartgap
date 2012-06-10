#library("qalqo:dartgap:testapp");

#import("dart:html");
#import("../lib.dart");

main() {
  dartgap.onDeviceReady = ((Device device) {
    // device API
    device.info.then((DeviceInfo deviceInfo) {
      _addHtml(""" 
        <article id='info' class='box'>
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
    
    // notification API
    _addHtml(""" 
      <article id='notification' class='box'>
        <h2>Dart Notifications</h2>
        <ul>
           <li><button id='alert'>Alert</button></li>
           <li><button id='beep'>Beep</button></li>
           <li><button id='confirm'>Confirm</button></li>
           <li><button id='vibrate'>Vibrate</button></li>
        </ul>
      </article>
    """);
    document.query("#alert").on.click.add((e) => device.notification.alert("Dart says hello"));
    document.query("#beep").on.click.add((e) => device.notification.beep(2));
    document.query("#confirm").on.click.add((e) {
      var callback = device.notification.confirm("Dart rocks");
      callback.then((int btn) => device.notification.alert("clicked $btn"));
    });
    document.query("#vibrate").on.click.add((e) => device.notification.vibrate(2000));
    
    // accelerometer API
    _addHtml(""" 
      <article id='accelerometer' class='box'>
        <h2>Dart Accelerometer</h2>
        <ul>
          <li><button id='current'>Get Current Acceleration</button></br>
            <ul>
              <li>X: <span id="x">unknown</span></li>
              <li>Y: <span id="y">unknown</span></li>
              <li>Z: <span id="z">unknown</span></li>
              <li>Time: <span id="time">unknown</span></li>
            </ul>
          </li>
        </ul>
      </article>
    """);
    document.query("#current").on.click.add((e) {
      var callback = device.accelerometer.currentAcceleration;
      callback.then((Map accelData) {
        document.query("#x").innerHTML = accelData["x"];
        document.query("#y").innerHTML = accelData["y"];
        document.query("#z").innerHTML = accelData["z"];
        document.query("#time").innerHTML = accelData["timestamp"];
      });
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
  });
}

_addHtmlTo(String html, Element target) => target.nodes.add(new Element.html(html));

_addHtml(String html) => _addHtmlTo(html, document.body);











