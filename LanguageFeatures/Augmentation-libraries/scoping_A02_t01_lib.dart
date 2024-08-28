// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error for both a static and instance member
/// of the same name to be defined on the same type, even if they live in
/// different lexical scopes.
///
/// @description Checks that it is a compile time error for both a static and
/// instance member of the same name to be defined on the same type, even if
/// they live in different lexical scopes.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'scoping_A02_t01.dart';

augment class C {
  String foo = "";
  String get bar => "";
  void set baz(String _) {}
  String qux() => "";
}

augment mixin M {
  String foo = "";
  String get bar => "";
  void set baz(String _) {}
  String qux() => "";
}

augment enum E {
  augment e0;
  final String foo = "";
  String get bar => "";
  void set baz(String _) {}
  String qux() => "";
}

augment extension Ext {
  String get bar => "";
  void set baz(String _) {}
  String qux() => "";
}

augment extension type ET {
  String get bar => "";
  void set baz(String _) {}
  String qux() => "";
}
