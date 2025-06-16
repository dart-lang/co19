// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArray<T> from<T extends JSAny>( JSObject arrayLike )
/// Creates a new, shallow-copied JavaScript `Array` instance from a JavaScript
/// iterable or array-like object.
///
/// @description Checks that this constructor creates a new, shallow-copied
/// JavaScript `Array` instance from a JavaScript array object.
/// @author sgrekhov22@gmail.com
/// @issue 60934

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  JSArray<JSArray<JSNumber>> ar = JSArray<JSArray<JSNumber>>.withLength(1);
  JSArray<JSNumber> val = JSArray<JSNumber>.withLength(1);
  val[0] = 42.toJS;
  ar[0] = val;
  JSArray<JSArray<JSNumber>> copy = JSArray.from(ar);
  Expect.equals(val, copy[0]);
  Expect.identical(val, copy[0]);
}
