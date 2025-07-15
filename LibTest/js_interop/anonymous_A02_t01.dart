// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation that indicates a JS annotated class is structural
/// and does not have a known JavaScript prototype.
///
/// A class marked with [anonymous] must have an unnamed factory constructor
/// with no positional arguments, only named arguments. Invoking the constructor
/// desugars to creating a JavaScript object literal with name-value pairs
/// corresponding to the parameter names and values.
///
/// @description Checks that it is not an error if a class annotated with
/// [anonymous] has no unnamed factory constructor. Creating an instance creates
/// an empty JS object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'js_utils.dart';

@anonymous
class C1 {
}

@anonymous
@staticInterop
@JS()
abstract class C2 {
}

main() {
  globalContext["o"] = C1().jsify();
  eval(r'''
    globalThis.keys = Object.keys(globalThis.o);
  ''');
  jsExpectArrayEquals(JSArray(), globalContext["keys"]);
  print(C2);
}
