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
/// @description Check that operators `[]` and `[]=` are allowed in the interop
/// types.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET();
  external JSAny operator [](String key);
  external void operator []=(String key, JSAny value);
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external ET2();
  external JSAny operator [](String index);
  external void operator []=(String index, JSAny value);
}

main() {
  eval(r'''
    class ET {
    }
    globalThis.ET = ET;
  ''');

  ET et = ET();
  et["one"] = 1.toJS;
  Expect.equals(1, (et["one"] as JSNumber).toDartInt);
  et["2"] = "two".toJS;
  Expect.equals("two", (et["2"] as JSString).toDart);

  ET2 et2 = ET2();
  et2["one"] = 1.toJS;
  Expect.equals(1, (et2["one"] as JSNumber).toDartInt);
  et2["2"] = "two".toJS;
  Expect.equals("two", (et2["2"] as JSString).toDart);
}
