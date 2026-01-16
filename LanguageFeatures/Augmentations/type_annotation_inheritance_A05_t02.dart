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

typedef NumAlias = num;

num topLevelVariable = 1;
augment abstract NumAlias topLevelVariable;

abstract final num finalTopLevelVariable;
augment final NumAlias finalTopLevelVariable = 2;

class C {
  num instanceVariable = 1;
  abstract final num finalInstanceVariable;
}

augment class C {
  augment abstract NumAlias instanceVariable;
  augment final NumAlias finalInstanceVariable = 2;
}

mixin M {
  abstract num instanceVariable;
  final num finalInstanceVariable = 2;
}

augment mixin M {
  augment NumAlias instanceVariable = 1;
  augment abstract final NumAlias finalInstanceVariable;
}

enum E {
  e0;
  final num finalInstanceVariable1 = 1;
  abstract final num finalInstanceVariable2;
}

augment enum E {
  ;
  augment abstract final NumAlias finalInstanceVariable1;
  augment final NumAlias finalInstanceVariable2 = 2;
}

class MA = Object with M;

main() {
  Expect.equals(1, topLevelVariable);
  Expect.equals(2, finalTopLevelVariable);
  Expect.equals(1, C().instanceVariable);
  Expect.equals(2, C().finalInstanceVariable);
  Expect.equals(1, MA().instanceVariable);
  Expect.equals(2, MA().finalInstanceVariable);
  Expect.equals(1, E.e0.finalInstanceVariable1);
  Expect.equals(2, E.e0.finalInstanceVariable2);
}
