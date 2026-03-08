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

var topLevelVariable1 = 1;
augment abstract int topLevelVariable1;

var topLevelVariable2;
augment abstract dynamic topLevelVariable2;

abstract var topLevelVariable3;
augment dynamic topLevelVariable3 = 3;

final finalTopLevelVariable1 = 1;
augment abstract final int finalTopLevelVariable1;

abstract final finalTopLevelVariable2;
augment final dynamic finalTopLevelVariable2 = 2;

class C {
  static var staticVariable1 = 1;
  static var staticVariable2;
  static abstract var staticVariable3;
  static final finalStaticVariable1 = 1;
  static abstract final finalStaticVariable2;

  var instanceVariable1 = 1;
  var instanceVariable2;
  abstract var instanceVariable3;
  final finalInstanceVariable1 = 1;
  final finalInstanceVariable2;
  abstract final finalInstanceVariable3;
}

augment class C {
  augment static abstract int staticVariable1;
  augment static abstract dynamic staticVariable2;
  augment static dynamic staticVariable3 = 3;
  augment static abstract final int finalStaticVariable1;
  augment static final dynamic finalStaticVariable2 = 2;

  augment abstract int instanceVariable1;
  augment abstract dynamic instanceVariable2;
  augment dynamic instanceVariable3 = 3;
  augment abstract final int finalInstanceVariable1;
  augment abstract final dynamic finalInstanceVariable2;
  augment final dynamic finalInstanceVariable3 = 3;
}

mixin M {
  static var staticVariable1 = 1;
  static var staticVariable2;
  static abstract var staticVariable3;
  static final finalStaticVariable1 = 1;
  static abstract final finalStaticVariable2;

  var instanceVariable1 = 1;
  var instanceVariable2;
  abstract var instanceVariable3;
  final finalInstanceVariable1 = 1;
  final finalInstanceVariable2;
  abstract final finalInstanceVariable3;
}

augment mixin M {
  augment static abstract int staticVariable1;
  augment static abstract dynamic staticVariable2;
  augment static dynamic staticVariable3 = 3;
  augment static abstract final int finalStaticVariable1;
  augment static final dynamic finalStaticVariable2 = 2;

  augment abstract int instanceVariable1;
  augment abstract dynamic instanceVariable2;
  augment dynamic instanceVariable3 = 3;
  augment abstract final int finalInstanceVariable1;
  augment abstract final dynamic finalInstanceVariable2;
  augment final dynamic finalInstanceVariable3 = 3;
}

enum E {
  e0;
  static var staticVariable1 = 1;
  static var staticVariable2;
  static abstract var staticVariable3;
  static final finalStaticVariable1 = 1;
  static abstract final finalStaticVariable2;

  final finalInstanceVariable1 = 1;
  final finalInstanceVariable2;
  abstract final finalInstanceVariable3;
}

augment enum E {
  ;
  augment static abstract int staticVariable1;
  augment static abstract dynamic staticVariable2;
  augment static dynamic staticVariable3 = 3;
  augment static abstract final int finalStaticVariable1;
  augment static final dynamic finalStaticVariable2 = 2;

  augment abstract final int finalInstanceVariable1;
  augment abstract final dynamic finalInstanceVariable2;
  augment final dynamic finalInstanceVariable3 = 3;
}

class A {}

extension Ext on A {
  static var staticVariable1 = 1;
  static var staticVariable2;
  static abstract var staticVariable3;
  static final finalStaticVariable1 = 1;
  static abstract final finalStaticVariable2;
}

augment extension Ext {
  augment static abstract int staticVariable1;
  augment static abstract dynamic staticVariable2;
  augment static dynamic staticVariable3 = 3;
  augment static abstract final int finalStaticVariable1;
  augment static final dynamic finalStaticVariable2 = 2;
}

extension type ET(int _) {
  static var staticVariable1 = 1;
  static var staticVariable2;
  static abstract var staticVariable3;
  static final finalStaticVariable1 = 1;
  static abstract final finalStaticVariable2;
}

augment extension type ET {
  augment static abstract int staticVariable1;
  augment static abstract dynamic staticVariable2;
  augment static dynamic staticVariable3 = 3;
  augment static abstract final int finalStaticVariable1;
  augment static final dynamic finalStaticVariable2 = 2;
}

class MA = Object with M;

main() {
  Expect.equals(1, topLevelVariable1);
  Expect.isNull(topLevelVariable2);
  Expect.equals(3, topLevelVariable3);
  Expect.equals(1, finalTopLevelVariable1);
  Expect.equals(2, finalTopLevelVariable2);

  Expect.equals(1, C.staticVariable1);
  Expect.isNull(C.staticVariable2);
  Expect.equals(3, C.staticVariable3);
  Expect.equals(1, C.finalStaticVariable1);
  Expect.equals(2, C.finalStaticVariable2);
  Expect.equals(1, C().instanceVariable1);
  Expect.isNull(C().instanceVariable2);
  Expect.equals(3, C().instanceVariable3);
  Expect.equals(1, C().finalInstanceVariable1);
  Expect.isNull(C().finalInstanceVariable2);
  Expect.equals(3, C().finalInstanceVariable3);

  Expect.equals(1, M.staticVariable1);
  Expect.isNull(M.staticVariable2);
  Expect.equals(3, M.staticVariable3);
  Expect.equals(1, M.finalStaticVariable1);
  Expect.equals(2, M.finalStaticVariable2);
  Expect.equals(1, MA().instanceVariable1);
  Expect.isNull(MA().instanceVariable2);
  Expect.equals(3, MA().instanceVariable3);
  Expect.equals(1, MA().finalInstanceVariable1);
  Expect.isNull(MA().finalInstanceVariable2);
  Expect.equals(3, MA().finalInstanceVariable3);

  Expect.equals(1, E.staticVariable1);
  Expect.isNull(E.staticVariable2);
  Expect.equals(3, E.staticVariable3);
  Expect.equals(1, E.finalStaticVariable1);
  Expect.equals(2, E.finalStaticVariable2);
  Expect.equals(1, E.e0.finalInstanceVariable1);
  Expect.isNull(E.e0.finalInstanceVariable2);
  Expect.equals(3, E.e0.finalInstanceVariable3);

  Expect.equals(1, Ext.staticVariable1);
  Expect.isNull(Ext.staticVariable2);
  Expect.equals(3, Ext.staticVariable3);
  Expect.equals(1, Ext.finalStaticVariable1);
  Expect.equals(2, Ext.finalStaticVariable2);

  Expect.equals(1, ET.staticVariable1);
  Expect.isNull(ET.staticVariable2);
  Expect.equals(3, ET.staticVariable3);
  Expect.equals(1, ET.finalStaticVariable1);
  Expect.equals(2, ET.finalStaticVariable2);
}
