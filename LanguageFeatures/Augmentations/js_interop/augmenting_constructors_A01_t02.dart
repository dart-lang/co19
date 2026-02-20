// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting constructors works similar to augmenting a function,
/// with some extra rules to handle features unique to constructors like
/// redirections and initializer lists
///
/// @description Checks that an js interop constructor can be augmented. Test a
/// class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

@JSExport()
class C {
  int id;
  C(this.id);
}

augment class C {
  augment C(int id);
}

void main() {
  var c = C(42);
  var jsC = createJSInteropWrapper<C>(c);
  globalContext["jsC"] = jsC;
  eval(r'''
    globalThis.jsId = globalThis.jsC.id;
  ''');
  Expect.equals(42, (globalContext["jsId"] as JSNumber).toDartInt);
}
