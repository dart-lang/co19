/*
 * Copyright (c) 2011-2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unforgeable object that comes back as equal when passed
 * through other isolates.
 *
 * @description Checks hashCode and equality operator for Capability
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../core/Object/allTests.lib.dart" as object;

Object create() => new Capability();

List<Object> createEqual(int number) =>
  new List.filled(number, new Capability(), growable:false);


List<Object> createNotEqual(int number) =>
  new List.generate(number, (_) => new Capability(), growable:false);

main() {
  object.test(create, createEqual, createNotEqual);
}
