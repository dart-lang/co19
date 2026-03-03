// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type annotation or type parameter bound is omitted in the
/// augmenting declaration, it is inferred to be the same as the corresponding
/// type annotation or type parameter bound in the declaration being augmented.
///
/// If the type annotation or type parameter bound is not omitted, then it's a
/// compile-time error if the type denoted by the augmenting declaration is not
/// the same type as the type in the corresponding declaration being augmented.
///
/// @description Check that it is not an error if an augmenting declaration
/// specifies the same variable type as the introductory declaration does.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

typedef NumAlias = num;

num topLevelVariable = 1;
augment abstract NumAlias topLevelVariable;

abstract final num finalTopLevelVariable;
augment final NumAlias finalTopLevelVariable = 2;

class C {
  static num staticVariable = 1;
  static abstract final num finalStaticVariable;
  num instanceVariable = 1;
  abstract final num finalInstanceVariable;
}

augment class C {
  augment static abstract NumAlias staticVariable;
  augment staic final NumAlias finalStaticVariable = 2;
  augment abstract NumAlias instanceVariable;
  augment final NumAlias finalInstanceVariable = 2;
}

mixin M {
  static abstract num staticVariable;
  static final num finalStaticVariable = 2;
  abstract num instanceVariable;
  final num finalInstanceVariable = 2;
}

augment mixin M {
  augment static NumAlias staticVariable = 1;
  augment static abstract final NumAlias finalStaticVariable;
  augment NumAlias instanceVariable = 1;
  augment abstract final NumAlias finalInstanceVariable;
}

enum E {
  e0;
  static num staticVariable = 1;
  static abstract final num finalStaticVariable;
  final num finalInstanceVariable1 = 1;
  abstract final num finalInstanceVariable2;
}

augment enum E {
  ;
  augment static abstract NumAlias staticVariable;
  augment staic final NumAlias finalStaticVariable = 2;
  augment abstract final NumAlias finalInstanceVariable1;
  augment final NumAlias finalInstanceVariable2 = 2;
}

class A {}

extension Ext on A {
  static abstract num staticVariable;
  static final num finalStaticVariable = 2;
}

augment extension Ext {
  augment static NumAlias staticVariable = 1;
  augment static abstract final NumAlias finalStaticVariable;
}

extension type ET(int _) {
  static num staticVariable = 1;
  static abstract final num finalStaticVariable;
}

augment extension type ET {
  augment static abstract NumAlias staticVariable;
  augment staic final NumAlias finalStaticVariable = 2;
}

class MA = Object with M;

main() {
  Expect.equals(1, topLevelVariable);
  Expect.equals(2, finalTopLevelVariable);
  Expect.equals(1, C.staticVariable);
  Expect.equals(2, C.finalStaticVariable);
  Expect.equals(1, C().instanceVariable);
  Expect.equals(2, C().finalInstanceVariable);
  Expect.equals(1, M.staticVariable);
  Expect.equals(2, M.finalStaticVariable);
  Expect.equals(1, MA().instanceVariable);
  Expect.equals(2, MA().finalInstanceVariable);
  Expect.equals(1, E.staticVariable);
  Expect.equals(2, E.finalStaticVariable);
  Expect.equals(1, E.e0.finalInstanceVariable1);
  Expect.equals(2, E.e0.finalInstanceVariable2);
  Expect.equals(1, Ext.staticVariable);
  Expect.equals(2, Ext.finalStaticVariable);
  Expect.equals(1, ET.staticVariable);
  Expect.equals(2, ET.finalStaticVariable);

}
