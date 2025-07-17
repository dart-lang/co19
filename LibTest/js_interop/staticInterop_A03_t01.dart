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
/// @description Checks that a class annotated with `@staticInterop` can interop
/// with JS objects.
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
  external String getString();
  external int getNumber();
  external bool getBool();
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
  C c = globalContext["obj"] as C;
  Expect.equals("I'm JS String", c.getString());
  Expect.equals(42, c.getNumber());
  Expect.equals(true, c.getBool());
}
