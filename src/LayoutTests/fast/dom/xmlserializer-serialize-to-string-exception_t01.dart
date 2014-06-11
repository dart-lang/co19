/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests XMLSerializer.serializeToString() throwing exception
 * when node value is invalid and passing otherwise.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <h1 id="heading"/>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldThrowException(node)
  {
    debug("Verifying XMLSerializer.serializeToString() should THROW exception with node value = " + node.runtimeType.toString());

    var xs = new XmlSerializer();
    shouldThrow(() => xs.serializeToString(node));
  }

  shouldNOTThrowException(node)
  {
    debug("Verifying XMLSerializer.serializeToString() should NOT-THROW exception with node value = " + node.runtimeType.toString());

    var xs = new XmlSerializer();
    xs.serializeToString(node);
  }

  shouldThrowException(null);
  shouldThrowException("<html><title>Hello World</title></html>");
  //shouldThrowException(document.children);
  shouldNOTThrowException(document);
  shouldNOTThrowException(document.documentElement);
  shouldNOTThrowException(document.firstChild);
  shouldNOTThrowException(document.createElement("div"));
  shouldNOTThrowException(document.getElementById("heading"));
  shouldNOTThrowException(document.createElement("custom"));

  var domParser = new DomParser();

  var htmlDoc = domParser.parseFromString("<html/>", "text/html");
  shouldNOTThrowException(htmlDoc);
  shouldNOTThrowException(htmlDoc.firstChild);

  var xmlDoc = domParser.parseFromString("<root/>", "text/xml");
  shouldNOTThrowException(xmlDoc);
  shouldNOTThrowException(xmlDoc.lastChild);
}
