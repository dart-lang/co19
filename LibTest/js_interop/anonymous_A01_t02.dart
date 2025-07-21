// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation that indicates a JS annotated class is structural
/// and does not have a known JavaScript prototype.
///
/// A class marked with [anonymous] allows external factories with named
/// parameters. Invoking these factories creates a JavaScript object literal
/// with name-value pairs corresponding to any named parameters and their
/// values. If there are no named parameters, an empty JavaScript object is
/// created.
/// [anonymous] classes have the following restrictions:
///   - They must contain a [JS] annotation, either from this library or from
///     `dart:js_interop`. If the latter, the class must also contain
///     [staticInterop].
///   - They cannot contain any non-external members unless it's a
///     [staticInterop] class, in which case it can also contain non-external
///     factories and static methods.
///   - They cannot contain any external generative constructors.
///   - Any external factory must not contain any positional parameters.
///   - They cannot extend or be extended by a non-[JS] annotated class.
///   - The annotation should only be applied to non-mixin classes and no other
///     declarations.
///
/// @description Checks that invoking the constructor desugars to creating a
/// JavaScript object literal with name-value pairs corresponding to the
/// parameter names and values. Test a named factory constructor.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

@anonymous
@staticInterop
@JS()
class C {
  external factory C.f({String s, int n, bool b});
}

main() {
  var c = C.f(s: "s value", n: 42, b: true);
  globalContext["c"] = c as JSObject;
  eval(r'''
    globalThis.resS = globalThis.c.s;
    globalThis.resN = globalThis.c.n;
    globalThis.resB = globalThis.c.b;
  ''');
  Expect.equals("s value", (globalContext["resS"] as JSString).toDart);
  Expect.equals(42, (globalContext["resN"] as JSNumber).toDartInt);
  Expect.equals(true, (globalContext["resB"] as JSBoolean).toDart);
}
