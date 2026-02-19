// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Extension declarations can be augmented.
///
/// @description Checks that an js interop extension can be augmented. Test an
/// extension on a `@staticInterop` class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

@anonymous
@staticInterop
@JS()
class C {
  external factory C({String s});
}

extension Ext on C {
  static int answer();
  int get zero;
}

augment extension Ext {
  augment static int answer() => 42;
  augment int get zero => 0;
  int get one => 1;
}

main() {
  var c = C(s: 's value');
  globalContext["c"] = c as JSObject;
  eval(r'''
    globalThis.resS = globalThis.c.s;
  ''');
  Expect.equals("s value", (globalContext['resS'] as JSString).toDart);
  Expect.equals(42, Ext.answer());
  Expect.equals(0, c.zero);
  Expect.equals(1, c.one);
}
