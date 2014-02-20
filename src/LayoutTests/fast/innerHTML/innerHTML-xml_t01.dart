/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test innerHTML in XHTML/XML documents
 * @needsreview Class 'Text' has no instance getter 'namespaceUri'
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  /*
  var doc = document.implementation.createHtmlDocument('test');
  var body = doc.body;

  body.setInnerHtml('''
    <svg xmlns="http://www.w3.org/2000/svg"></svg>
    <bar xmlns="http://test/foo"></bar>''', treeSanitizer: new NullTreeSanitizer());

  var namespaces = [
    "http://www.w3.org/2000/svg",
    "http://test/foo"
      ];
  var elementnames = [
    "svg",
    "bar"
      ];
  var texts = [
    "&lt;g/>",
    "&lt;body>&lt;/body>"
      ];

  var element, childns;
  g(ns, elementName, text, appendOrSelect) {
    if (appendOrSelect == "append") {
      element = doc.createElementNS(ns, elementName);
      doc.body.append(element);
      childns = ns;
    } else {
      element = doc.querySelector(elementName);
      childns = element.namespaceUri;
    }
    element.innerHtml = text;
    Expect.equals(childns, element.firstChild.namespaceUri);
  }

  namespaces.forEach((ns) {
    elementnames.forEach((elementname) {
      texts.forEach((text) {
        g(ns, elementname, text, "append");
        g(ns, elementname, text, "select");
      });
    });
  });
  */
}

