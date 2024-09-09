// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An augmenting variable’s initializing expression uses `augmented`, and the
/// stack of augmented declarations do not include a variable with an explicit
/// initializing expression. For nullable fields, the implicit null
/// initialization only happens if there is no explicit initializer after the
/// entire stack of augmentations has been applied.
///
/// @description Checks that for nullable fields, the implicit null
/// initialization happens if there is no explicit initializer after the entire
/// stack of augmentations has been applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_members_A05_t01_lib.dart';

String? topLevelVariable;

class C {
  static String? staticVariable;
  String? instanceVariable;
}

mixin M {
  static String? staticVariable;
  String? instanceVariable;
}

enum E {
  e0;
  static String? staticVariable;
}

class A {}

extension Ext on A {
  static String? staticVariable;
}

extension type ET(String _) {
  static String? staticVariable;
}

class MA = Object with M;

main() {
  Expect.isNull(topLevelVariable);
  Expect.isNull(C.staticVariable);
  Expect.isNull(C().instanceVariable);
  Expect.isNull(M.staticVariable);
  Expect.isNull(MA().instanceVariable);
  Expect.isNull(E.staticVariable);
  Expect.isNull(Ext.staticVariable);
  Expect.isNull(ET.staticVariable);
}
