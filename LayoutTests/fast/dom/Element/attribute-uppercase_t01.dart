/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks whether attribute names with uppercase work
 * properly in HTML documents.
 * @needsreview test14 originally tests for hasAttribute() instead of
 * getAttribute(), but dart does not have such method
 * test14 fails because of that
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var elem = document.createElement('test');
  elem.setAttribute('attr_name', 'attr_value');
  
  Expect.equals('attr_value', elem.getAttribute('attr_name'), 'test1');
  Expect.equals('attr_value', elem.attributes['attr_name'], 'test2');
  Expect.equals('attr_value', elem.getAttributeNS(null, 'attr_name'), 'test3');
  Expect.equals('attr_value', elem.getNamespacedAttributes(null)['attr_name'], 'test4');

  Expect.equals('attr_value', elem.getAttribute('ATTR_NAME'), 'test5');
  Expect.equals('attr_value', elem.attributes['ATTR_NAME'], 'test6');

  Expect.equals('', elem.getAttributeNS(null, 'ATTR_NAME'), 'test7');
  Expect.equals('', elem.getNamespacedAttributes(null)['ATTR_NAME'], 'test8');

  elem.setAttribute('attr_name', 'attr_value');
  elem.attributes.remove('attr_name');
  Expect.isNull(elem.getAttribute('attr_name'), 'test9');

  elem.setAttribute('attr_name', 'attr_value');
  elem.getNamespacedAttributes(null).remove('attr_name');
  Expect.isNull(elem.getAttribute('attr_name'), 'test10');

  elem.setAttribute('attr_name', 'attr_value');
  elem.attributes.remove('ATTR_NAME');
  Expect.isNull(elem.getAttribute('attr_name'), 'test11');

  elem.setAttribute('attr_name', 'attr_value');
  elem.getNamespacedAttributes(null).remove('ATTR_NAME');
  Expect.equals('attr_value', elem.getAttribute('attr_name'), 'test12');

  elem.setAttributeNS(null, 'attr_name', 'attr_value');
  Expect.equals('attr_value', elem.getAttribute('attr_name'), 'test13');
  elem.getNamespacedAttributes(null).remove('attr_name');

  elem.setAttributeNS(null, 'ATTR_NAME', 'attr_value');
  Expect.equals(null, elem.getAttribute('attr_name'), 'test14');
  elem.getNamespacedAttributes(null).remove('ATTR_NAME');
}
