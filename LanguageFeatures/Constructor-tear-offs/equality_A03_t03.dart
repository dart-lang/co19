// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of instantiated local generic functions
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

Function foo(String message) {
  int g() => message.length;
  return g;
}

main() {
  var f1 = foo("1");
  var f2 = foo("123");
  Expect.notEquals(f1, f2);
}
