// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean delete( JSAny property )
/// Deletes the property with key `property` from this [JSObject].
///
/// @description Check that this function deletes the property with key
/// `property` from this [JSObject]. Test JS interop object created by the
/// factory constructor with named parameters.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external factory ET({int p1, String p2, bool p3});
  external int? get p1;
  external String? get p2;
  external bool? get p3;
}

main() {
  ET et = ET(p1: 1, p2: "2", p3: true);
  Expect.equals(1, et.p1);
  et.delete("p1".toJS);
  Expect.isNull(et.p1);

  Expect.equals("2", et.p2);
  et.delete("p2".toJS);
  Expect.isNull(et.p2);

  Expect.isTrue(et.p3);
  et.delete("p3".toJS);
  Expect.isNull(et.p3);
}
