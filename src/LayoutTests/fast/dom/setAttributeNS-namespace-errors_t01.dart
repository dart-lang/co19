/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that calling setAttributeNS() throws an error when
 * http://www.w3.org/TR/dom/#dom-element-setattributens says it should.
 */
import "dart:html";
import "../../testcommon.dart";

_shouldThrow(func()) =>
  shouldThrow(func, (e) => e is DomException && e.name == DomException.NAMESPACE);

main() {
  var elem = document.createElement('test');

  // Spec: http://www.w3.org/TR/dom/#dom-element-setattributens

  // Step 5.
  _shouldThrow(() {
    elem.setAttributeNS(null, 'foo:bar', 'baz');
  });

  // Step 6.
  shouldNotThrow(() {
    elem.setAttributeNS('http://www.w3.org/XML/1998/namespace',
      'xml:abc', 'foo');
  });
  _shouldThrow(() {
    elem.setAttributeNS('http://www.w3.org/not-XML/1998/namespace',
      'xml:abc', 'foo');
  });

  // Step 7.
  shouldNotThrow(() {
    elem.setAttributeNS('http://www.w3.org/2000/xmlns/',
      'xmlns', 'http://wwww.example.org');
  });

  _shouldThrow(() {
    elem.setAttributeNS('http://www.w3.org/2000/not-xmlns/',
      'xmlns', 'http://wwww.example.org');
  });

  shouldNotThrow(() {
    elem.setAttributeNS('http://www.w3.org/2000/xmlns/',
      'xmlns:abc', 'http://wwww.example.org');
  });

  _shouldThrow(() {
    elem.setAttributeNS('http://www.w3.org/2000/not-xmlns/',
      'xmlns:abc', 'http://wwww.example.org');
  });

  // Step 8.
  _shouldThrow(() {
    elem.setAttributeNS('http://www.w3.org/2000/xmlns/',
      'badprefix:xmlns', 'http://wwww.example.org');
  });
  _shouldThrow(() {
    elem.setAttributeNS('http://www.w3.org/2000/xmlns/',
      'notxmlns', 'http://wwww.example.org');
  });
}
