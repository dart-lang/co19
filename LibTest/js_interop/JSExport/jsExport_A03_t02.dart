// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion By default, the property will have the same name as the
/// corresponding instance member. You can change the property name of a member
/// in the JS object by providing a `name` in the `@JSExport` annotation on the
/// member.
///
/// @description Checks that the `createJSInteropWrapper` throws if an argument
/// is a class annotated with  a `@JSExport` annotation with a specified `name`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';

@JSExport("D")
class C {
  int variable = 42;
  String method(String v) => "method($v);";
  String get getter => "Some getter";
  void set setter(bool value) {}
}

void main() {
  var c = C();
  Expect.throws(() {
    createJSInteropWrapper<C>(c);
  });
}
