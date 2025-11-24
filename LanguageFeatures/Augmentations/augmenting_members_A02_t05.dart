// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// A non-writable variable declaration is augmented with a setter.
///
/// @description Checks that it is not an error to augment a `late final`
/// variable declaration with no initializer with a setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_members_A02_t05_lib.dart';

String _log = "";

late final String topLevelVariable;

class C {
  static late final String staticVariable;
  late final String instanceVariable;
}

mixin M {
  static late final String staticVariable;
  late final String instanceVariable;
}

enum E {
  e0;
  static late final String staticVariable;
}

class A {}

extension Ext on A {
  static late final String staticVariable;
}

extension type ET(String _) {
  static late final String staticVariable;
}

class MA = Object with M;

main() {
  topLevelVariable = "a";
  Expect.equals("Augmented: a", _log);
  C.staticVariable = "b";
  Expect.equals("Augmented: b", _log);
  C().instanceVariable = "c";
  Expect.equals("Augmented: c", _log);
  M.staticVariable = "d";
  Expect.equals("Augmented: d", _log);
  MA().instanceVariable = "e";
  Expect.equals("Augmented: e", _log);
  E.staticVariable = "f";
  Expect.equals("Augmented: f", _log);
  Ext.staticVariable = "g";
  Expect.equals("Augmented: g", _log);
  ET.staticVariable = "h";
  Expect.equals("Augmented: h", _log);
}
