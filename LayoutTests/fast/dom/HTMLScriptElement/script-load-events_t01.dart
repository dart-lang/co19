/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Generate load events for script elements.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <p id="results">FAIL: Test never finished.</p>
    ''', treeSanitizer: new NullTreeSanitizer());

  var status_ = new Map();

  EventListener loaded(i) => (_) {
    status_[i] = "L";
  };

  EventListener erred(i) => (_) {
    status_[i] = "E";
  };

  ScriptElement s = new ScriptElement();
  s.type = "text/javascript";
  s.src = "IntentionallyMissingFile.js";
  s.onLoad.listen(loaded(0));
  s.onError.listen(erred(0));
  document.body.append(s);
  
  s = new ScriptElement();
  s.type = "text/javascript";
  s.src = "IntentionallyMissingFile.js";
  s.onLoad.listen(loaded(1));
  s.onError.listen(erred(1));
  document.body.append(s);
  
  s = new ScriptElement();
  s.type = "text/javascript";
  s.src = "$root/resources/script-load.js";
  s.onLoad.listen(loaded(2));
  s.onError.listen(erred(2));
  document.body.append(s);

  endTest()
  {
    var failures = "";
    if (status_[0] != "E")
      failures += "0 ";
    if (status_[1] != "E")
      failures += "1 ";

    if (status_[2] != "L")
      failures += "2 ";
    if (status_[5] != "L")
      failures += "5 ";

    var results = document.getElementById("results");
    if (failures != "")
      testFailed("The following tests failed: " + failures);
    else
      results.innerHtml = "PASS";
  }

  asyncStart();
  window.onLoad.first.then((_) {
    ScriptElement e = document.createElement("script");
    e.type = "text/javascript";
    e.src = '$root/resources/script-load.js';
    e.onLoad.listen((_) {
        loaded(5)(null);
        endTest();
        asyncEnd();
    });
    asyncStart();
    document.getElementsByTagName("head")[0].append( e ); 
    asyncEnd();
  });
}
