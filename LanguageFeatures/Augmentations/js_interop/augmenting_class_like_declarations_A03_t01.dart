// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension, extension type, mixin, or mixin class
/// declaration can be marked with an `augment` modifier
///
/// @description Checks that an js interop enum can be augmented.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

enum E {
  e0(0), e1(1);

  final int v;
  const E(this.v);

  int id() => v;
}

@JSExport()
augment enum E {}

void main() {
  var jsE0 = createJSInteropWrapper<E>(E.e0);
  var jsE1 = createJSInteropWrapper<E>(E.e1);
  globalContext["jsE0"] = jsE0;
  globalContext["jsE1"] = jsE1;
  eval(r'''
    globalThis.v0 = globalThis.jsE0.v;
    globalThis.v1 = globalThis.jsE1.v;
    globalThis.id0 = globalThis.jsE0.id();
    globalThis.id1 = globalThis.jsE1.id();
  ''');
  Expect.equals(0, (globalContext["v0"] as JSNumber).toDartInt);
  Expect.equals(1, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals(0, (globalContext["id0"] as JSNumber).toDartInt);
  Expect.equals(1, (globalContext["id1"] as JSNumber).toDartInt);
}
