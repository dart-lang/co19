// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSExportedDartFunction get toJS
/// A callable JavaScript function that wraps this [Function].
///
/// @description Check that in case of a torn off constructor it is a run-time
/// error to call it in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
extension type ET(JSNumber id) {
  ET.c1(this.id);

  @JS()
  ET.c2(JSNumber id): this(id);

  @JS()
  factory ET.c3(JSNumber id) = ET.c1;
}

main() {
  globalContext["jsC0"] = ET.new.toJS;
  globalContext["jsC1"] = ET.c1.toJS;
  globalContext["jsC2"] = ET.c2.toJS;
  globalContext["jsC3"] = ET.c3.toJS;
  eval(r'''
    try {
      globalThis.jsC0();
    } catch(e) {
      globalThis.thrown0 = true;
    }
    try {
      globalThis.jsC1();
    } catch(e) {
      globalThis.thrown1 = true;
    }
    try {
      globalThis.jsC2();
    } catch(e) {
      globalThis.thrown2 = true;
    }
    try {
      globalThis.jsC3();
    } catch(e) {
      globalThis.thrown3 = true;
    }
  ''');
  Expect.isTrue((globalContext["thrown0"] as JSBoolean).toDart);
  Expect.isTrue((globalContext["thrown1"] as JSBoolean).toDart);
  Expect.isTrue((globalContext["thrown2"] as JSBoolean).toDart);
  Expect.isTrue((globalContext["thrown3"] as JSBoolean).toDart);
}
