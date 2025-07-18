// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `staticInterop` enables the JS annotated class to be treated as
/// a "static" interop class.
///
/// These classes allow interop with native types, like the ones in `dart:html`.
/// These classes should not contain any instance members, inherited or
/// otherwise, and should instead use static extension members.
///
/// @description Checks that a class annotated with `@staticInterop` can extend,
/// mixin or implement another class/mixin annotated with `@staticInterop`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

@staticInterop
@JS()
abstract mixin class A {}

extension Ext on A {
  external String getString();
  external int getNumber();
  external bool getBool();
}

@staticInterop
@JS()
class C1 extends A {
}

@staticInterop
@JS()
class C2 implements A {
}

@staticInterop
@JS()
class C3 = Object with A;

main() {
  eval(r'''
    globalThis.obj = {
      getString: function () {
        return "I'm JS String";
      },
      getNumber: function () {
        return 42;
      },
      getBool: function () {
        return true;
      }
    };
  ''');

  C1 c1 = globalContext["obj"] as C1;
  Expect.equals("I'm JS String", c1.getString());
  Expect.equals(42, c1.getNumber());
  Expect.equals(true, c1.getBool());

  C2 c2 = globalContext["obj"] as C2;
  Expect.equals("I'm JS String", c2.getString());
  Expect.equals(42, c2.getNumber());
  Expect.equals(true, c2.getBool());

  C3 c3 = globalContext["obj"] as C3;
  Expect.equals("I'm JS String", c3.getString());
  Expect.equals(42, c3.getNumber());
  Expect.equals(true, c3.getBool());
}
