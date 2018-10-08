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

  debug('html');
  var htmlDoc = document.implementation.createHtmlDocument("");
  htmlDoc.documentElement.innerHtml = "<body><div id='target'></div></body>";
  testEventsFiredOn(htmlDoc);

  debug('xhtml');
  var xhtmlDoc = document.implementation.createDocument('http://www.w3.org/1999/xhtml', 'html', null);
  xhtmlDoc.documentElement.innerHtml = "<body><div id='target'></div></body>";
  testEventsFiredOn(xhtmlDoc);

  debug('svg');
  var svgDoc = document.implementation.createDocument('http://www.w3.org/2000/svg', 'svg', null);
  var target = svgDoc.createElement("g");
  target.setAttribute("id", "target");
  svgDoc.documentElement.append(target);
  testEventsFiredOn(xhtmlDoc);

  debug('xml');
  var xmlDoc = document.implementation.createDocument('http://www.example.com/', 'foo', null);
  target = xmlDoc.createElement("bar");
  target.setAttribute("id", "target");
  xmlDoc.documentElement.append(target);
  testEventsFiredOn(xmlDoc);
}
