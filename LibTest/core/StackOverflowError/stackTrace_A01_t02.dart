// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion StackTrace stackTrace
/// @description Checks that this property is [null] if error is thrown.
/// See https://api.dart.dev/stable/2.13.4/dart-core/StackOverflowError/stackTrace.html:
/// @author sgrekhov@unipro.ru
/// @issue 28179, 31676

import "../../../Utils/expect.dart";

f() {
  f();
}

main() {
  Error e = new StackOverflowError();
  Expect.isNull(e.stackTrace);
  try {
    f();
  } on StackOverflowError catch (er) {
    Expect.isNull(e.stackTrace);
  }
}
