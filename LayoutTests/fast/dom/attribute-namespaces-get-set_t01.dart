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
  var src = '<root xmlns:foo="http://www.example.com" attr="test2" foo:attr="test" />';
  var doc = (new DomParser()).parseFromString(src, 'text/xml');
  var docElem = doc.documentElement;

  // Test getAttribute
  shouldBe(docElem.getAttribute('foo:attr'), "test");
  shouldBe(docElem.getAttribute('attr'), "test2");
  shouldBe(docElem.getAttribute('bar:attr'), null);

  // Test hasAttribute
  shouldBe(docElem.hasAttribute('foo:attr'), true);
  shouldBe(docElem.hasAttribute('attr'), true);
  shouldBe(docElem.hasAttribute('bar:attr'), false);

  // Test getAttribute
  shouldBe(docElem.getAttribute('foo:attr').value, "test");
  shouldBe(docElem.getAttribute('bar:attr'), null);

  // Test setAttribute
  //dart's attributes map does not include namepaspaced attributes
  //shouldBe(docElem.attributes.length, 3);
  shouldBe(docElem.attributes.length, 1);
  docElem.setAttribute("foo:attr", "new");
  shouldBe(docElem.attributes.length, 1);
  shouldBe(docElem.getAttribute('foo:attr'), "new");

  docElem.setAttribute("bar:attr", "new2");
  shouldBe(docElem.attributes.length, 1);
  shouldBe(docElem.getAttribute('bar:attr'), "new2");

  // Test attributes.remove
  docElem.attributes.remove('foo:attr');
  shouldBe(docElem.getAttribute('foo:attr'), null);
  shouldBe(docElem.attributes.length, 1);
  docElem.attributes.remove('bar:attr');
  shouldBe(docElem.getAttribute('bar:attr'), null);
  shouldBe(docElem.attributes.length, 1);
  docElem.attributes.remove('attr');
  shouldBe(docElem.getAttribute('attr'), null);
  shouldBe(docElem.attributes.length, 0);
}
