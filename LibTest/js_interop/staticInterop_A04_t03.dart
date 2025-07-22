// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `staticInterop` enables the JS annotated class to be treated as
/// a "static" interop class.
///
/// These classes implicitly all erase to the internal interceptor
/// `JavaScriptObject`, so they can be freely casted to and from other
/// [staticInterop] types, `dart:html` types, and `JSObject` from
/// `dart:js_interop`. Non-[staticInterop] `package:js` types can be casted to
/// [staticInterop] types, but the reverse can fail if the underlying value is a
/// `@Native`-reserved type (like `dart:html` types).
///
/// [staticInterop] classes have the following restrictions:
///  - They must contain a [JS] annotation, either from this library or from
///    `dart:js_interop`.
///  - They should not contain any instance members, inherited or otherwise, and
///    should instead use static extension members, which can be external or
///    non-external.
///  - They can only contain factories and `static` members. They can be
///    combined with [anonymous] to make external factories create new
///    JavaScript object literals instead.
///  - They should not implement, extend, or mixin non-[staticInterop] classes
///    and vice-versa.
///  - The annotation should only be applied to non-mixin classes and no other
///    declarations.
///
/// @description Checks that a class annotated with `@staticInterop` can extend,
/// or implement another class/mixin annotated with `@staticInterop`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

@staticInterop
@JS()
abstract class A {}

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
}
