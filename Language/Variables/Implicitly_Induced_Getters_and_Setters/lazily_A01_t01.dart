// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A declaration of a static or library variable with an
/// initializing expression is initialized lazily.
///
/// @description Checks that a declaration of a static or library variable with
/// an initializing expression is initialized lazily.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

String log = '';

String init(String v) {
  log = v;
  return v;
}

class C {
  static String s1 = init('s1');
  static final String s2 = init('s2');
  static late String s3 = init('s3');
  static late final String s4 = init('s4');
}

mixin M {
  static String s1 = init('s1');
  static final String s2 = init('s2');
  static late String s3 = init('s3');
  static late final String s4 = init('s4');
}

enum E {
  e0;
  static String s1 = init('s1');
  static final String s2 = init('s2');
  static late String s3 = init('s3');
  static late final String s4 = init('s4');
}

class A {}

extension Ext on A {
  static String s1 = init('s1');
  static final String s2 = init('s2');
  static late String s3 = init('s3');
  static late final String s4 = init('s4');
}

extension type ET(int _) {
  static String s1 = init('s1');
  static final String s2 = init('s2');
  static late String s3 = init('s3');
  static late final String s4 = init('s4');
}

main() {
  Expect.equals('', log);
  C.s1;
  Expect.equals('s1', log);
  C.s2;
  Expect.equals('s2', log);
  C.s3;
  Expect.equals('s3', log);
  C.s4;
  Expect.equals('s4', log);
  M.s1;
  Expect.equals('s1', log);
  M.s2;
  Expect.equals('s2', log);
  M.s3;
  Expect.equals('s3', log);
  M.s4;
  Expect.equals('s4', log);
  E.s1;
  Expect.equals('s1', log);
  E.s2;
  Expect.equals('s2', log);
  E.s3;
  Expect.equals('s3', log);
  E.s4;
  Expect.equals('s4', log);
  Ext.s1;
  Expect.equals('s1', log);
  Ext.s2;
  Expect.equals('s2', log);
  Ext.s3;
  Expect.equals('s3', log);
  Ext.s4;
  Expect.equals('s4', log);
  ET.s1;
  Expect.equals('s1', log);
  ET.s2;
  Expect.equals('s2', log);
  ET.s3;
  Expect.equals('s3', log);
  ET.s4;
  Expect.equals('s4', log);
}
