// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=static-extensions

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

class C {
  final String id;
  C._(this.id);
}

mixin class MC {
  String id = "";
  MC._();
}

mixin M {
  String get id;
}

class MA with M {
  final String id;
  MA(this.id);
}

enum E {
  e0._("e0"),
  e1._("e1");

  final String id;
  const E._(this.id);
}

extension type ET._(String id) {}

extension ExtC on C {
  factory(String id) => C._("ExtC($id)");
  factory named(String id, {String suffix = "!"}) =>
      C._("ExtC.named($id$suffix)");
  factory redirecting(String id) = C._;
}

extension ExtMC on MC {
  factory(String id) => MC._()..id = "ExtMC($id)";
  factory named(String id, [String suffix = "!"]) =>
      MC._()..id = "ExtMC.named($id$suffix)";
}

extension ExtM on M {
  factory(String id) => MA("ExtM($id)");
  factory named(String id) => MA("ExtM.named($id)");
  factory redirecting(String id) = MA;
}

extension ExtE on E {
  factory(int index) => E.values[index];
  factory named(String id) => E.values.firstWhere((e) => e.id == id);
}

extension ExtET on ET {
  factory(String id) => ET._("ExtET($id)");
  factory named(String id) => ET._("ExtET.named($id)");
  factory redirecting(String id) = ET._;
}

void testeeMain() {
  debugger();
}

Future<void> main([args = const <String>[]]) =>
    startServiceTest(testeeConcurrent: testeeMain);
