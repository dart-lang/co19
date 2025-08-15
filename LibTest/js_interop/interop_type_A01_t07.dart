// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that a JS interop type member may contain in its
/// signature extension types with `bool`, `num`, `double`, `int` and `String`
/// as representation types.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type BoolET(bool v) implements bool {}
extension type NumET(num v) implements num {}
extension type IntET(int v) implements int {}
extension type DoubleET(double v) implements double {}
extension type StringET(String v) implements String {}

extension type ET._(JSObject _) implements JSObject {
  external ET.fromDart(NumET v1);
  external factory ET.fromNum(IntET v1, DoubleET v2);

  external NumET v1;
  external NumET v2;
  external StringET v;
  external BoolET foo();
  external void bar(StringET _);
}

main() {
  eval(r'''
    class ET {
      constructor(v1, v2) {
        this.v1 = v1;
        this.v2 = v2;
      }
      foo() {
        return true;
      }
      bar(v) {
        this.v = v;
      }
    }
    globalThis.ET = ET;
  ''');
  ET et1 = ET.fromDart(NumET(1));
  Expect.equals(1, et1.v1);
  Expect.isTrue(et1.foo());
  et1.bar(StringET("x"));
  Expect.equals("x", et1.v);

  ET et2 = ET.fromNum(IntET(2), DoubleET(3));
  Expect.equals(2, et2.v1);
  Expect.equals(3, et2.v2);
}
