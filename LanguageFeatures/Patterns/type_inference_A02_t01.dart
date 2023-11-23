// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Null-assert: A context type schema E? where E is the context type schema of
/// the inner pattern
///
/// @description Check that the context type schema for null-assert pattern is a
/// context type schema E? where E is the context type schema of the inner
/// pattern
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  String log = "";
  var (num v1!) = getType(42, (String s) {log += s;});
  Expect.equals("num?", log);
}
