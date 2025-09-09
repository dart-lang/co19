// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArray<T> get toJSProxyOrRef
/// Converts this [List] to a [JSArray] by either casting, unwrapping, or
/// proxying the [List].
///
/// @description Check that this method converts this [List] to a [JSArray].
/// @author sgrekhov22@gmail.com
/// @issue 61327

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval("globalThis.a = [1, 2, 3];");
  List<JSNumber> l = (globalContext["a"] as JSArray<JSNumber>).toDart;
  JSArray<JSNumber> a = l.toJSProxyOrRef;
  Expect.listEquals(l, a.toDart);
}
