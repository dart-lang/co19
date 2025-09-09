// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArray<T> get toJS
/// Converts this [List] to a [JSArray] by either casting, unwrapping, or
/// cloning the [List].
///
/// @description Check that this method converts this [List] to a [JSArray].
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  List<JSString> l1 = List<JSString>.empty();
  JSArray<JSString> a1 = l1.toJS;
  Expect.equals(0, a1.length);

  List<JSNumber> l2 = [1.toJS, 2.toJS, 3.toJS];
  JSArray<JSNumber> a2 = l2.toJS;
  Expect.listEquals(l2, a2.toDart);
}
