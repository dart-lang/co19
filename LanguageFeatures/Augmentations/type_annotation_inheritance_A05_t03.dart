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

// TODO (sgrekhov) This test does not include static abstract variable
// declarations because the grammar doesn't derive them. See
// https://github.com/dart-lang/language/issues/4592

import '../../Utils/expect.dart';

var topLevelVariable1 = 1;
augment abstract int topLevelVariable1;

var topLevelVariable2;
augment abstract dynamic topLevelVariable2;

abstract var topLevelVariable3;
augment dynamic topLevelVariable3 = 3;

final finalTopLevelVariable1 = 1;
augment abstract final int finalTopLevelVariable1;

final finalTopLevelVariable2;
augment abstract final dynamic finalTopLevelVariable2;

abstract final finalTopLevelVariable3;
augment final dynamic finalTopLevelVariable3 = 3;

class C {
  var instanceVariable1 = 1;
  var instanceVariable2;
  abstract var instanceVariable3;
  final finalInstanceVariable1 = 1;
  final finalInstanceVariable2;
  abstract final finalInstanceVariable3;
}

augment class C {
  augment abstract int instanceVariable1;
  augment abstract dynamic instanceVariable2;
  augment dynamic instanceVariable3 = 3;
  augment abstract final int finalInstanceVariable1;
  augment abstract final dynamic finalInstanceVariable2;
  augment final dynamic finalInstanceVariable3 = 3;
}

mixin M {
  var instanceVariable1 = 1;
  var instanceVariable2;
  abstract var instanceVariable3;
  final finalInstanceVariable1 = 1;
  final finalInstanceVariable2;
  abstract final finalInstanceVariable3;
}

augment mixin M {
  augment abstract int instanceVariable1;
  augment abstract dynamic instanceVariable2;
  augment dynamic instanceVariable3 = 3;
  augment abstract final int finalInstanceVariable1;
  augment abstract final dynamic finalInstanceVariable2;
  augment final dynamic finalInstanceVariable3 = 3;
}

enum E {
  e0;
  final finalInstanceVariable1 = 1;
  final finalInstanceVariable2;
  abstract final finalInstanceVariable3;
}

augment enum E {
  ;
  augment abstract final int finalInstanceVariable1;
  augment abstract final dynamic finalInstanceVariable2;
  augment final dynamic finalInstanceVariable3 = 3;
}

class MA = Object with M;

main() {
  Expect.equals(1, topLevelVariable1);
  Expect.isNull(topLevelVariable2);
  Expect.equals(3, topLevelVariable3);
  Expect.equals(1, finalTopLevelVariable1);
  Expect.isNull(finalTopLevelVariable2);
  Expect.equals(3, finalTopLevelVariable3);

  Expect.equals(1, C().instanceVariable1);
  Expect.isNull(C().instanceVariable2);
  Expect.equals(3, C().instanceVariable3);
  Expect.equals(1, C().finalInstanceVariable1);
  Expect.isNull(C().finalInstanceVariable2);
  Expect.equals(3, C().finalInstanceVariable3);

  Expect.equals(1, MA().instanceVariable1);
  Expect.isNull(MA().instanceVariable2);
  Expect.equals(3, MA().instanceVariable3);
  Expect.equals(1, MA().finalInstanceVariable1);
  Expect.isNull(MA().finalInstanceVariable2);
  Expect.equals(3, MA().finalInstanceVariable3);

  Expect.equals(1, E.e0.finalInstanceVariable1);
  Expect.isNull(E.e0.finalInstanceVariable2);
  Expect.equals(3, E.e0.finalInstanceVariable3);
}
