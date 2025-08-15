// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that a JS interop type member may contain an
/// `ExternalDartReference` in its signature.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

class C {
  int id;
  String name;
  C(this.id, this.name);
}

extension type ET._(JSObject _) implements JSObject {
  external ET.fromDart(ExternalDartReference<C> v);
  external factory ET.fromDartFactory(ExternalDartReference<C> v);

  external ExternalDartReference<C> foo();
  external ExternalDartReference<C> bar(ExternalDartReference<C> _);
}

main() {
  eval(r'''
    class ET {
      constructor(v) {
        this.v = v;
      }
      foo() {
        return this.v;
      }
      bar(v) {
        return v;
      }
    }
    globalThis.ET = ET;
  ''');
  C c1 = C(42, "Object from Dart");
  ET et1 = ET.fromDart(c1.toExternalReference);
  ExternalDartReference<C> ref1 = et1.foo();
  Expect.equals(42, ref1.toDartObject.id);
  Expect.equals("Object from Dart", ref1.toDartObject.name);
  var ref2 = et1.bar(c1.toExternalReference);
  Expect.equals(42, ref2.toDartObject.id);
  Expect.equals("Object from Dart", ref2.toDartObject.name);

  C c2 = C(1, "one");
  ET et2 = ET.fromDartFactory(c2.toExternalReference);
  ExternalDartReference<C> ref3 = et2.foo();
  Expect.equals(1, ref3.toDartObject.id);
  Expect.equals("one", ref3.toDartObject.name);
}
