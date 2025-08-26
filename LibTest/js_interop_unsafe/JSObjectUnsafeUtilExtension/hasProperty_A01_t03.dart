// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean hasProperty( JSAny property )
/// Whether or not this JSObject contains the property key property.
///
/// @description Check that this function returns 'true` if this [JSObject] has
/// property `property` and `false` otherwise. Test non-string properties.
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
  Expect.isTrue(obj.hasProperty(1.toJS).toDart);
  Expect.isTrue(obj.hasProperty("1".toJS).toDart);
  Expect.isTrue(obj.hasProperty(true.toJS).toDart);
  Expect.isTrue(obj.hasProperty("true".toJS).toDart);
}
