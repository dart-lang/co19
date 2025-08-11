// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Unlike interop members and interop types, Dart only ever adds a
/// library name in the JS invocation if you provide a non-empty value in the
/// `@JS()` annotation on the library. It doesn't use the Dart name of the
/// library as the default.
///
/// @description Check that if a library name has a `@JS()` annotation with an
/// empty string as a name then no library name is used.
/// @author sgrekhov22@gmail.com

@JS("")
library some_interop_lib;

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

@JS()
external int answer();

@JS("answer")
external int theAnswer();

@JS()
external int v;

main() {
  eval(r'''
    var v = 0;
    function answer() {
      return 42;
    }
  ''');
  Expect.equals(42, answer());
  Expect.equals(42, theAnswer());
  v = 1;
  Expect.equals(1, v);
}
