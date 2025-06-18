// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArray<T> from<T extends JSAny>( JSObject arrayLike )
/// Creates a new, shallow-copied JavaScript `Array` instance from a JavaScript
/// iterable or array-like object.
///
/// @description Checks that this constructor creates a new JavaScript `Array`
/// instance from a JavaScript array object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  JSArray<JSNumber> a0 = JSArray<JSNumber>();
  JSArray<JSNumber> copy0 = JSArray.from(a0);
  Expect.notEquals(a0, copy0);

  globalContext["a0"] = a0;
  globalContext["copy0"] = copy0;
  eval(r'''
    globalThis.b0 = copy0.length === 0;
    globalThis.eq0 = copy0 == a0;
    ''');
  Expect.isTrue((globalContext["b0"] as JSBoolean).toDart);
  Expect.isFalse((globalContext["eq0"] as JSBoolean).toDart);

  JSArray<JSNumber> a3 = JSArray<JSNumber>.withLength(3);
  a3[0] = 0.toJS;
  a3[1] = 1.toJS;
  a3[2] = 2.toJS;
  JSArray<JSNumber> copy3 = JSArray.from(a3);
  Expect.notEquals(a3, copy3);
  Expect.listEquals([0, 1, 2], copy3.dartify());

  globalContext["a3"] = a3;
  globalContext["copy3"] = copy3;
  eval(r'''
    var b3 = copy3.length === 3;
    var eq3 = copy3 == a3;
    ''');
  Expect.isTrue((globalContext["b3"] as JSBoolean).toDart);
  Expect.isFalse((globalContext["eq3"] as JSBoolean).toDart);
}
