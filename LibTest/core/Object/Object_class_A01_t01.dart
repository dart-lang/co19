/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The base class for all Dart objects.
 *    Because Object is the root of the Dart class hierarchy, every other Dart
 * class is a subclass of Object.
 *    When you define a class, you should override toString to return a string
 * describing an instance of that class. You might also need to define hashCode
 * and ==, as described in the Implementing map keys section of the library
 * tour.
 *
 * @description Tests for Object methods that can be inherited by other tests.
 *
 * @author a.semenov@unipro.ru
 */

import "allTests.lib.dart";

Object create() => new Object();

List<Object> createEqual(int number) {
  Object o = new Object();
  return new List.filled(number, o, growable:false);
}

List<Object> createNotEqual(int number) {
  return new List.generate(number, (_) => new Object(), growable:false);
}

main() {
  test(create, createEqual, createNotEqual);
}
