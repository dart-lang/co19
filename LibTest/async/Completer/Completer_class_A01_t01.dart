/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Completer<T> A way to produce Future objects and to complete
 * them later with a value or error.
 * @description Check methods and properties, inherited from Object
 * @author a.semenov@unipro.ru
 */
import "../../core/Object/allTests.lib.dart" as object;
import "dart:async";

Object create() => new Completer();

List<Object> createEqual(int number) =>
  new List.filled(number, new Completer(), growable:false);

List<Object> createNonEqual(int number) =>
  new List.generate(number, (_) => new Completer(), growable:false);

main() {
  object.test(create, createEqual, createNonEqual);
}
