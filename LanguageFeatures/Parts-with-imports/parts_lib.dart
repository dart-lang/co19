// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Common library for "Parts with imports" tests.
///
/// @description Common library for "Parts with imports" tests.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

library parts_lib;

String log = "";

String libVar = "libVar";
String get libGetter => "libGetter";
void set libSetter(String _) {
  log = "libSetter";
}
String libFunc() => "libFunc";

class LibClass {
  static final String id = "LibClass";
}
mixin LibMixin {
  static final String id = "LibMixin";
}
enum LibEnum {
  e0;
  static final String id = "LibEnum";
}
class A {}
extension LibExt on A {
  static final String id = "LibExt";
}
extension type LibET(int _) {
  static final String id = "LibET";
}
