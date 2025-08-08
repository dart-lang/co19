// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// - Constructors. When called, constructors with only positional parameters
///   create a new JS object whose constructor is defined by the name of the
///   extension type using `new`.
///
/// @description Check that it is not an error if a JS interop type declares a
/// constructor but the appropriate interop object in JS doesn't declare a
/// constructor.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET(int id, String? name);

  external int? get id;
  external String? get name;
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external factory ET2(int id, String? name);

  external int? get id;
  external String? get name;
}

main() {
  eval(r'''
    class ET {}
    globalThis.ET = ET;
  ''');
  ET et1 = ET(1, "one");
  Expect.isNull(et1.id);
  Expect.isNull(et1.name);
  globalContext["et1"] = et1;
  Expect.isNotNull(globalContext["et1"]);

  ET2 et2 = ET2(2, "two");
  Expect.isNull(et2.id);
  Expect.isNull(et2.name);
  globalContext["et2"] = et2;
  Expect.isNotNull(globalContext["et2"]);
}
