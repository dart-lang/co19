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
/// @description Checks that inline classes may have constant constructors
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class IC1 {
  final int id;
  const IC1(this.id);
}

inline class IC2<T> {
  final T id;
  const IC2(this.id);
}

inline class IC3<T extends Object> {
  final T id;
  const IC3(this.id);
}

inline class IC4<T extends num> {
  final T id;
  const IC4(this.id);
}

const v1 = const IC1(42);
const v2 = const IC2<bool>(true);
const v3 = const IC3<String>("42");
const v4 = const IC4<int>(42);

void foo1([IC1 v = v1]) {}
void foo2([IC2 v = v2]) {}
void foo3([IC3 v = v3]) {}
void foo4([IC4 v = v4]) {}

main() {
  foo1();
  foo2();
  foo3();
  foo4();
}
