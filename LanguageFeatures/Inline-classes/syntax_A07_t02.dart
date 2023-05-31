// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
///
/// @description Checks that inline classes may have factory constructors
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC1 {
  final int id;
  IC1(this.id);

  factory IC1.f1(int id) = IC1;
  factory IC1.f2(int id) => IC1(id);
}

inline class IC2<T> {
  final T id;
  IC2(this.id);

  factory IC2.f1(T id) = IC2;
  factory IC2.f2(T id) => IC2(id);
}

inline class IC3<T extends Object> {
  final T id;
  IC3(this.id);

  factory IC3.f1(T id) = IC3;
  factory IC3.f2(T id) => IC3(id);
}

inline class IC4<T extends num> {
  final T id;
  const IC4(this.id);

  factory IC4.f1(T id) = IC4;
  factory IC4.f2(T id) => IC4(id);
}

main() {
  var ic1_1 = IC1.f1(1);
  Expect.equals(1, ic1_1.id);
  var ic1_2 = IC1.f2(1);
  Expect.equals(1, ic1_2.id);

  var ic2_1 = IC2<int>.f1(2);
  Expect.equals(2, ic2_1.id);
  var ic2_2 = IC2.f2(2);
  Expect.equals(2, ic2_2.id);

  var ic3_1 = IC3<int>.f1(3);
  Expect.equals(3, ic3_1.id);
  var ic3_2 = IC3.f2(3);
  Expect.equals(3, ic3_2.id);

  var ic4_1 = IC4<int>.f1(4);
  Expect.equals(4, ic4_1.id);
  var ic4_2 = IC4.f2(4);
  Expect.equals(4, ic4_2.id);
}
