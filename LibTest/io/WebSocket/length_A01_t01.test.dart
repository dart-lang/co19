// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Future<int> length
///    Counts the elements in the stream.
/// @description Checks that [length] returns number of elements in the stream.
/// @author a.semenov@unipto.ru

library length_A01_t01;
import "../../../Utils/expect.dart";

List<List<int>> BYTES = new List.generate(
    10,
    (int i) => new List.generate(i, (int k) => k * 2)
);

void test(var create) {
  dynamic expected = 0;
  dynamic data = [];
  AsyncExpect.value(expected, create(data).then((s) => s.length));
  expected = 4;
  data = ["1", "2", "3", "null"];
  AsyncExpect.value(expected, create(data).then((s) => s.length));
  expected = BYTES.length;
  data = BYTES;
  AsyncExpect.value(expected, create(data).then((s) => s.length));
  expected = 2;
  data = [[12,34,56],[78,90]];
  AsyncExpect.value(expected, create(data).then((s) => s.length));
}
