/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test ensures that we can attach various DOMs to the document.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var cases = [
  {
    "markup": "<Long />",
    "tagName": 'Long',
    "serialization": '<Long/>'
  }, {
    "markup": "<Long><b>15</b></Long>",
    "tagName": 'Long',
    "serialization": '<Long><b>15</b></Long>'
  }, {
    "markup": "<Long id='1'>1</Long>",
    "tagName": 'Long',
    "serialization": '<Long id="1">1</Long>'
  }, {
    "markup": "<Long id='1'>15<b>1</b>16</Long>",
    "tagName": 'Long',
    "serialization": '<Long id="1">15<b>1</b>16</Long>'
  }
  ];

  for (var c in cases) {
    var doc = document.implementation.createDocument("", "", null);
    var doc2 = (new DomParser()).parseFromString(c['markup'], "text/xml");
    Element u = doc.importNode(doc2.childNodes[0], true);
    shouldBe(u.tagName, c['tagName']);
    doc.append(u);
    shouldBe((new XmlSerializer()).serializeToString(doc),
        c['serialization']);
  }
}
