/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the serialization of XML namespaces on attributes, as 
 * reported in <a href="http://crbug.com/248044">bug 248044</a>.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var doc = (new DomParser())
    .parseFromString('<outer attr1="value1" xmlns="http://www.example.com"/>',
        'text/xml');
  // XML-namespaced attributes should get the "xml" prefix.
  doc.documentElement.setAttributeNS('http://www.w3.org/XML/1998/namespace', 'id', 'outer');
  // Attributes with the same namespace as the element should get a prefix.
  doc.documentElement.setAttributeNS('http://www.example.com', 'foo', 'bar');
  doc.documentElement.setAttributeNS('http://www.example.com', 'foo2', 'bar2');
  // Two attributes with the same namespace and different prefixes shouldn't confuse the serializer.
  doc.documentElement.setAttributeNS('http://www.example.com/ns1', 'fizz', 'buzz');
  // A prefix declared in an xmlns attribute (coming soon) shouldn't get another xmlns attribute.
  doc.documentElement.setAttributeNS('http://www.example.com/ns1', 'prefix1:fizz2', 'buzz2');
  // A prefix without a matching xmlns attribute should get one during serialization.
  doc.documentElement.setAttributeNS('http://www.example.com/ns2', 'prefix2:name', 'value');
  doc.documentElement.setAttributeNS('http://www.example.com/ns2', 'name2', 'value2');
  // Namespace declaration for the prefix1:fizz attribute.
  doc.documentElement.setAttributeNS('http://www.w3.org/2000/xmlns/', 'xmlns:prefix1', 'http://www.example.com/ns1');
  // Element with the same namespace as the parent.
  var innerElement = doc.createElementNS("http://www.example.com", 'inner');
  doc.documentElement.append(innerElement);
  // An attribute with no namespace doesn't need a prefix.
  innerElement.setAttributeNS(null, 'id', 'inner');

  // Check the DOM construction.
  shouldBe(doc.documentElement.getAttributeNS(null, "attr1"), "value1");
  shouldBe(doc.documentElement.getAttributeNS("http://www.example.com", "foo"), "bar");
  shouldBe(doc.documentElement.getAttributeNS("http://www.example.com", "foo2"), "bar2");
  shouldBe(doc.documentElement.getAttributeNS("http://www.example.com/ns1", "fizz"), "buzz");
  shouldBe(doc.documentElement.getAttributeNS("http://www.example.com/ns1", "fizz2"), "buzz2");
  shouldBe(doc.documentElement.getAttributeNS("http://www.example.com/ns2", "name"), "value");
  shouldBe(doc.documentElement.getAttributeNS("http://www.example.com/ns2", "name2"), "value2");
  shouldBe(doc.documentElement.getAttributeNS("http://www.w3.org/XML/1998/namespace", "id"), "outer");
  shouldBe(doc.querySelector("inner").localName, "inner");
  shouldBe(doc.querySelector("inner").namespaceUri, "http://www.example.com");
  shouldBe(doc.querySelector("inner").getAttributeNS(null, "id"), "inner");

  var xmlText = (new XmlSerializer()).serializeToString(doc); // exported for debugging
  var parsedDoc = (new DomParser()).parseFromString(xmlText, 'text/xml');

  // Check the serialization result.
  shouldBe(parsedDoc.documentElement.getAttributeNS(null, "attr1"), "value1");
  shouldBe(parsedDoc.documentElement.getAttributeNS("http://www.example.com", "foo"), "bar");
  shouldBe(parsedDoc.documentElement.getAttributeNS("http://www.example.com", "foo2"), "bar2");
  shouldBe(parsedDoc.documentElement.getAttributeNS("http://www.example.com/ns1", "fizz"), "buzz");
  shouldBe(parsedDoc.documentElement.getAttributeNS("http://www.example.com/ns1", "fizz2"), "buzz2");
  shouldBe(parsedDoc.documentElement.getAttributeNS("http://www.example.com/ns2", "name"), "value");
  shouldBe(parsedDoc.documentElement.getAttributeNS("http://www.example.com/ns2", "name2"), "value2");
  shouldBe(parsedDoc.documentElement.getAttributeNS("http://www.w3.org/XML/1998/namespace", "id"), "outer");
  shouldBe(parsedDoc.querySelector("inner").localName, "inner");
  shouldBe(parsedDoc.querySelector("inner").namespaceUri, "http://www.example.com");
  shouldBe(parsedDoc.querySelector("inner").getAttributeNS(null, "id"), "inner");
}
