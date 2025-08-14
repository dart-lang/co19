// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that a JS interop type member may contain a
/// `@staticInterop` type in its signature.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

@staticInterop
@JS()
class C {
}

extension Ext on C {
  external String id();
}

extension type ET._(JSObject _) implements JSObject {
  external ET.fromDart(C c);
  external factory ET.fromDartFactory(C c);

  external C foo();
  external C bar(C _);
}

main() {
  eval(r'''
    globalThis.obj = {
      id: function () {
        return "I'm C";
      }
    };
  ''');
  C c = globalContext["obj"] as C;
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

  ET et1 = ET.fromDart(c);
  C ref1 = et1.foo();
  Expect.equals("I'm C", ref1.id());
  var ref2 = et1.bar(c);
  Expect.equals("I'm C", ref2.id());

  ET et2 = ET.fromDartFactory(c);
  C ref3 = et2.foo();
  Expect.equals("I'm C", ref3.id());
}
