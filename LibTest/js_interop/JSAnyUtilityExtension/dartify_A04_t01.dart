// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Object? dartify()
/// Converts a JavaScript value to the Dart equivalent if possible.
///
/// Effectively the inverse of `NullableObjectUtilExtension.jsify`, `dartify`
/// takes a JavaScript value and recursively converts it to a Dart object. Only
/// JavaScript primitives, `Arrays`, typed arrays, and map-like objects with
/// string property names are supported.
///
/// @description Checks that `dartify()` converts JavaScript `Promise` to Dart
/// `Future`.
/// @author sgrekhov22@gmail.com
/// @issue 54573

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() async {
  eval(r'''
    globalThis.p = new Promise((resolve, reject) => {
      resolve("Success");
    });
  ''');
  var f = globalContext["p"].dartify();
  Expect.isTrue(f is Future);
  Expect.equals("Success", await f);
}
