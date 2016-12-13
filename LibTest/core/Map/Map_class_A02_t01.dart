/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<K, V> abstract class
 * An unordered collection of key-value pairs, from which you retrieve a value
 * by using its associated key.
 * Each key must be unique. Null values are supported, but null keys are not.
 * @description Checks that null keys are not supported.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

main() {
  Map<String, Object> map = new Map<String, Object>();
  map[null] = "123";
  Expect.equals("123", map[null]);
}
