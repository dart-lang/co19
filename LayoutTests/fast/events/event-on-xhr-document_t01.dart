/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  handle(list, id) => (event) {
    list.add(event.type + "@" + id);
  };

  testEventsFiredOn(doc) {
    var caughtFoo = [];
    var root = doc.documentElement;
    var target = doc.getElementById("target");

    target.addEventListener("foo", handle(caughtFoo, "target"));
    target.onClick.listen((_) => caughtFoo.add('click@target'));
    root.addEventListener("foo", handle(caughtFoo, "root"));
    root.onClick.listen((_) => caughtFoo.add('click@root'));

    caughtFoo.length = 0;
    target.dispatchEvent(new Event("foo", canBubble: true));
    shouldBeList(caughtFoo, ['foo@target', 'foo@root']);

    caughtFoo.length = 0;
    target.dispatchEvent(new MouseEvent("click", canBubble: true));
    shouldBeList(caughtFoo, ['click@target', 'click@root']);
  }

  var xhrForXML = new HttpRequest();
  xhrForXML.open("GET", "$root/resources/hello-xhr-event.xml", async:false);
  xhrForXML.send();
  testEventsFiredOn(xhrForXML.responseXml);

  asyncStart();

  // Must run asynchronous to use responseType.
  var xhrForHTML = new HttpRequest();
  xhrForHTML.open("GET", "$root/resources/hello-xhr-event.html", async:true);
  xhrForHTML.responseType = "document";
  xhrForHTML.onLoad.listen((_) {
    testEventsFiredOn(xhrForHTML.response);
    asyncEnd();
  });
  xhrForHTML.send();
}
