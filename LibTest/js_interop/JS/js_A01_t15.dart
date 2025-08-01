// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that it is not an error if an external JS interop
/// function has a type parameter.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
external T f1<T extends JSAny>();

@JS()
external T f2<T extends JSObject>(T _);

main() {
  eval(r'''
    globalThis.f1 = function() {return 1;};
    globalThis.f2 = function(v) {return v;};
  ''');
  Expect.equals(1, f1<JSNumber>().toDartInt);
  Expect.mapEquals(
      {"a": "b"},
      f2<JSObject>({"a": "b"}.jsify() as JSObject).dartify()
  );
}
