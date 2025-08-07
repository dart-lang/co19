// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// ...
/// - Instance members. Like with other Dart types, instance members require an
///   instance to be used. These members get, set, or invoke properties on the
///   instance.
///
/// @description Check that it is a run-time error if a JS type returns a value
/// with an incompatible type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET();
  external int variable;
  external int get getter;
  external String method();
  external void set setter(int value);
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external ET2();
  external int variable;
  external int get getter;
  external String method();
  external void set setter(int value);
}

main() {
  eval(r'''
    class ET {
      constructor() {
        this.variable = "variable";
      }
      get getter() {
        return this.variable;
      }
      method() {
        return 42;
      }
      set setter(value) {
        this.variable = value;
      }
    }
    globalThis.ET = ET;
  ''');
  ET et = ET();
  Expect.throws(() {
    et.variable;
  });
  Expect.throws(() {
    et.getter;
  });
  Expect.throws(() {
    et.method();
  });
  et.setter = 42;
  Expect.equals(42, et.getter);
}
