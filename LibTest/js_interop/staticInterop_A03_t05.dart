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
/// @description Checks that a class annotated with `@staticInterop` can be
/// `abstract`, `base`, `final`, `sealed` or `interface`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

@staticInterop
@JS()
abstract class C1 {
}

@staticInterop
@JS()
base class C2 {
}

@staticInterop
@JS()
final class C3 {
}

@staticInterop
@JS()
sealed class C4 {
}

@staticInterop
@JS()
interface class C5 {
}

extension Ext1 on C1 {
  external String getString();
  external int getNumber();
  external bool getBool();
}

extension Ext2 on C2 {
  external String getString();
  external int getNumber();
  external bool getBool();
}

extension Ext3 on C3 {
  external String getString();
  external int getNumber();
  external bool getBool();
}

extension Ext4 on C4 {
  external String getString();
  external int getNumber();
  external bool getBool();
}

extension Ext5 on C5 {
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

  C4 c4 = globalContext["obj"] as C4;
  Expect.equals("I'm JS String", c4.getString());
  Expect.equals(42, c4.getNumber());
  Expect.equals(true, c4.getBool());

  C5 c5 = globalContext["obj"] as C5;
  Expect.equals("I'm JS String", c5.getString());
  Expect.equals(42, c5.getNumber());
  Expect.equals(true, c5.getBool());
}
