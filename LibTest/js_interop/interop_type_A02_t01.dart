// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that it is not an error to declare an external
/// constructor on a JS interop extension type whose representation type is
/// [JSAny].
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type MyAny._(JSAny _) implements JSAny {
  external MyAny.fromDart(String value);
  external String foo();
}

@JS('MyAny')
extension type MyAny2._(JSAny _) implements JSAny {
  external MyAny2(num value);
  external num foo();
}

main() {
  eval(r'''
    class MyAny {
      constructor(v) {
        this.v = v;
      }
      foo() {
        return this.v;
      }
    }
    globalThis.MyAny = MyAny;
  ''');

  MyAny ma = MyAny.fromDart("x");
  Expect.equals("x", ma.foo());

  MyAny2 ma2 = MyAny2(42);
  Expect.equals(42, ma2.foo());
}
