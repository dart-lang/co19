/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that calling createElementNS() throws an error when
 * http://www.w3.org/TR/dom/#dom-document-createelementns says it should.
 */
import "dart:html";
import "../../testcommon.dart";

_shouldThrow(func()) =>
  shouldThrow(func,
    (e) => e is DomException && e.name == DomException.NAMESPACE);

main() {
  // Spec: http://www.w3.org/TR/dom/#dom-document-createelementns

  // Step 5.
  shouldThrow(() => document.createElementNS(null, 'foo:bar'));

  // Step 6.
  shouldNotThrow(() => document.createElementNS('http://www.w3.org/XML/1998/namespace', 'xml:abc'));
  shouldBe(document.createElementNS('http://www.w3.org/XML/1998/namespace', 'xml:abc').namespaceUri, "http://www.w3.org/XML/1998/namespace");
  shouldBe(document.createElementNS('http://www.w3.org/XML/1998/namespace', 'xml:abc').nodeName, "xml:abc");
  shouldBe(document.createElementNS('http://www.w3.org/XML/1998/namespace', 'xml:abc').localName, "abc");
  _shouldThrow(() => document.createElementNS('http://www.w3.org/not-XML/1998/namespace', 'xml:abc'));

  // Step 7.
  shouldNotThrow(() => document.createElementNS('http://www.w3.org/2000/xmlns/', 'xmlns'));
  shouldBe(document.createElementNS('http://www.w3.org/2000/xmlns/', 'xmlns').namespaceUri, "http://www.w3.org/2000/xmlns/");
  shouldBe(document.createElementNS('http://www.w3.org/2000/xmlns/', 'xmlns').nodeName, "xmlns");
  shouldBe(document.createElementNS('http://www.w3.org/2000/xmlns/', 'xmlns').localName, "xmlns");
  _shouldThrow(() => document.createElementNS('http://www.w3.org/2000/not-xmlns/', 'xmlns'));

  shouldNotThrow(() => document.createElementNS('http://www.w3.org/2000/xmlns/', 'xmlns:abc', 'http://wwww.example.org'));
  shouldBe(document.createElementNS('http://www.w3.org/2000/xmlns/', 'xmlns:abc').namespaceUri, "http://www.w3.org/2000/xmlns/");
  shouldBe(document.createElementNS('http://www.w3.org/2000/xmlns/', 'xmlns:abc').nodeName, "xmlns:abc");
  shouldBe(document.createElementNS('http://www.w3.org/2000/xmlns/', 'xmlns:abc').localName, "abc");
  _shouldThrow(() => document.createElementNS('http://www.w3.org/2000/not-xmlns/', 'xmlns:abc', 'http://wwww.example.org'));

  // Step 8.
  _shouldThrow(() => document.createElementNS('http://www.w3.org/2000/xmlns/', 'badprefix:xmlns'));
  _shouldThrow(() => document.createElementNS('http://www.w3.org/2000/xmlns/', 'notxmlns'));
}
