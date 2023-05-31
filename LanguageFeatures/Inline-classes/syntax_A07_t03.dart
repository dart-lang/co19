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
/// @description Checks that inline classes may have redirecting constructors
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC1 {
  final int id;
  IC1(this.id);

  IC1.r(int id) : this(id);
}

inline class IC2<T> {
  final T id;
  IC2(this.id);

  IC2.r(T id) : this(id);
}

inline class IC3<T extends Object> {
  final T id;
  IC3(this.id);

  IC3.r(T id) : this(id);
}

inline class IC4<T extends num> {
  final T id;
  const IC4(this.id);

  IC4.r(T id) : this(id);
}

main() {
  var ic1 = IC1.r(1);
  Expect.equals(1, ic1.id);

  var ic2 = IC2<int>.r(2);
  Expect.equals(2, ic2.id);

  var ic3 = IC3<int>.r(3);
  Expect.equals(3, ic3.id);

  var ic4 = IC4<int>.r(4);
  Expect.equals(4, ic4.id);
}
