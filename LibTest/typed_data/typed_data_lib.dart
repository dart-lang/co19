// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Helper library for typed_data tests.
/// @author sgrekhov22@gmail.com

import "dart:typed_data";

import "../../Utils/expect.dart";

void check<T>(TypedDataList<T> list, [String separator = ""]) {
  var actual = list.join(separator);
  var expected = StringBuffer();
  bool comma = false;
  for (var v in list) {
    if (comma) {
      expected.write(separator);
    }
    comma = true;
    expected.write("$v");
  }
  Expect.equals(expected.toString(), actual);
}
