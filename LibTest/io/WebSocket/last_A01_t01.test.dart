// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Future<T> last
/// Returns the last element of the stream.
/// @description Checks that the last element is returned.
/// @author a.semenov@unipro.ru

library last_A01_t01;
import "../../../Utils/expect.dart";

void test(var create) {
  dynamic expected = "123";
  dynamic data = ["123"];
  AsyncExpect.value(expected, create(data).then((Stream s) => s.last));
  data = ["aaa", "123"];
  AsyncExpect.value(expected, create(data).then((Stream s) => s.last));
  expected = [123];
  data = [[123]];
  AsyncExpect.value(expected, create(data).then((Stream s) => s.last));
  expected = [6];
  data = [[123],[45],[6]];
  AsyncExpect.value(expected, create(data).then((Stream s) => s.last));
}
