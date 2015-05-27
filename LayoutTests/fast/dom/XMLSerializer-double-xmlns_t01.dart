/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that attributes created setAttributeNS() don't cause two
 * identical xmlns attributes to be serialized
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var doc = (new DomParser()).parseFromString('<test/>', 'text/xml');
  doc.documentElement.setAttributeNS('http://www.example.com', 'ns:attr', 'value');
  doc.documentElement.setAttributeNS('http://www.w3.org/2000/xmlns/', 'xmlns:ns', 'http://www.example.com');

  // Check the DOM construction.
  shouldBe(doc.documentElement.getAttributeNS("http://www.example.com", "attr"), "value");

  var xmlText = (new XmlSerializer()).serializeToString(doc); // exported for debugging
  var parsedDoc = (new DomParser()).parseFromString(xmlText, 'text/xml');

  // Check the serialization result.
  shouldBe(parsedDoc.documentElement.getAttributeNS("http://www.example.com", "attr"), "value");
}
