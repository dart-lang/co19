// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// ...
/// - Operators. There are only two external interop operators allowed in
///   interop types: [] and []=. These are instance members that match the
///   semantics of JS' property accessors.
///
/// @description Check that it is a run-time error if a `[]` operator returns a
/// value with an incompatible type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET();
  external int operator [](String key);
  external void operator []=(String key, JSAny value);
}

main() {
  eval(r'''
    class ET {
    }
    globalThis.ET = ET;
  ''');

  ET et = ET();
  et["2"] = "two".toJS;
  Expect.throws(() {
    et["2"];
  });
}
