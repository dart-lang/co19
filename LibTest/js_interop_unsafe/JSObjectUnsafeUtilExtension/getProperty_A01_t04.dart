// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion R getProperty<R extends JSAny?>( JSAny property )
/// The value of the property key `property` of this [JSObject].
///
/// @description Check that this function returns the value of the property key
/// `property` of this [JSObject]. Test non-string properties.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

main() {
  eval(r'''
    globalThis.object1 = {
      1: 42,
      true: 1
    };
  ''');
  JSObject obj = globalContext["object1"] as JSObject;
  Expect.equals(42, obj.getProperty<JSNumber>(1.toJS).toDartInt);
  Expect.equals(42, obj.getProperty<JSNumber>("1".toJS).toDartInt);
  Expect.equals(1, obj.getProperty<JSNumber>(true.toJS).toDartInt);
}
