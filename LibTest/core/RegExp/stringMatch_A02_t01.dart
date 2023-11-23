// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Throws [Error] if [str] is [:null:].
/// @description Checks that the correct exception is thrown.
/// @author msyabro

import "../../../Utils/expect.dart";

dynamic getNull() => null;

check(String pattern, [bool multiLine = false, bool caseSensitive = true]) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: caseSensitive);
  Expect.throws(() => re.stringMatch(getNull()));
}

main() {
  check("");
  check("a");
  check(r"^[^\n\r]+$", true, false);
}
