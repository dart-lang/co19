// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool instanceof( JSFunction constructor )
///
/// Whether this `JSAny?` is an instance of `constructor`.
///
/// @description Checks that `instanceof()` returns `true` if this `JSAny?` is
/// an instance of `constructor` and `false` otherwise.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    function A(id, name) {
      this.id = id;
      this.name = name;
    }
    function B() {}
    
    globalThis.fnB = B;
    globalThis.fnA = A;
    globalThis.objA = new A(42, "A form JS");
    globalThis.objB = new B();
  ''');
  Expect.isTrue(
    globalContext["objA"].instanceof(globalContext["fnA"] as JSFunction),
  );
  Expect.isTrue(
    globalContext["objB"].instanceof(globalContext["fnB"] as JSFunction),
  );
  Expect.isFalse(
    globalContext["objA"].instanceof(globalContext["fnB"] as JSFunction),
  );
  Expect.isFalse(
    globalContext["objF"].instanceof(globalContext["fnA"] as JSFunction),
  );
}
