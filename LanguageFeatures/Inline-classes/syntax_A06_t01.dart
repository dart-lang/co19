// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A rule for <inlineClassDeclaration> is added to the grammar,
/// along with some rules for elements used in inline class declarations:
///
/// <inlineClassDeclaration> ::=
///   'final'? 'inline' 'class' <typeIdentifier> <typeParameters>? <interfaces>?
///   '{'
///     (<metadata> <inlineMemberDeclaration>)*
///   '}'
///
/// <inlineMemberDeclaration> ::= <classMemberDefinition>
/// ...
/// There are no special rules for static members in inline classes. They can be
/// declared and called or torn off as usual, e.g., Inline.myStaticMethod(42)
///
/// @description Checks that inline classes may have static members. Note that
/// static members are declared before instance members (and before the unique
/// instance variable). This is not likely to be the style which is recommended,
/// but it should be used in at least one test.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC1 {
  static int get staticGetter => 42;
  final int id;
  IC1(this.id);
}

inline class IC2 {
  static int _v = 0;
  static void set staticSetter(int val) {
    _v = val;
  }
  final int id;
  IC2(this.id);
}

inline class IC3 {
  static int staticMethod(int val) => val;
  final int id;
  IC3(this.id);
}

inline class IC4 {
  static int staticVar = 0;
  final int id;
  IC4(this.id);
}

main() {
  Expect.equals(42, IC1.staticGetter);
  IC2.staticSetter = -42;
  Expect.equals(-42, IC2._v);
  Expect.equals(2, IC3.staticMethod(2));
  Expect.equals(0, IC4.staticVar);
  IC4.staticVar = 1;
  Expect.equals(1, IC4.staticVar);
}
