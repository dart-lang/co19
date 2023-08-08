// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type declaration DV named Name may declare one or
/// more constructors. A constructor which is declared in an extension type
/// declaration is also known as an extension type constructor.
///
/// The <representationDeclaration> works as a constructor. The optional
/// ('.' <identifierOrNew>) in the grammar is used to declare this constructor
/// with a name of the form <identifier> '.' <identifier> (at times described as
/// a "named constructor"), or <identifier> '.' 'new'. It is a constant
/// constructor if and only if the reserved word const occurs just after
/// extension type in the header of the declaration. Other constructors may be
/// declared const or not, following the normal rules for constant constructors.
///
/// @description Checks that an extension type may declare different
/// constructors
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type ET1.c0(int id) {
  ET1.c1() : this(0);
  ET1.c2(this.id);
  ET1.c3(int a, int b) : id = a + b;
  ET1.c4(int a, [int b = 1]) : id = a + b;
  ET1.c5(int a, {int b = 2}) : id = a + b;
  ET1.c6(int a, {required int b}) : id = a + b;
  factory ET1.f1() = ET1.c1;
  factory ET1.f2(int v) => ET1.c2(v);
}

extension type const ET2<T>.c0(int id) {
  const ET2.c1() : this(0);
  const ET2.c2(this.id);
  const ET2.c3(int a, int b) : id = a + b;
  const ET2.c4(int a, [int b = 1]) : id = a + b;
  const ET2.c5(int a, {int b = 2}) : id = a + b;
  const ET2.c6(int a, {required int b}) : id = a + b;
  factory ET2.f1() = ET2.c1;
  factory ET2.f2(int v) => ET2.c2(v);
}

main() {
  Expect.equals(0, ET1.c0(0).id);
  Expect.equals(0, ET1.c1().id);
  Expect.equals(1, ET1.c2(1).id);
  Expect.equals(3, ET1.c3(1, 2).id);
  Expect.equals(4, ET1.c4(3).id);
  Expect.equals(5, ET1.c4(3, 2).id);
  Expect.equals(6, ET1.c5(4).id);
  Expect.equals(7, ET1.c5(4, b: 3).id);
  Expect.equals(8, ET1.c6(5, b: 3).id);
  Expect.equals(0, ET1.f1().id);
  Expect.equals(9, ET1.f2(9).id);

  Expect.equals(0, ET2<String>.c0(0).id);
  Expect.equals(0, ET2<String>.c1().id);
  Expect.equals(1, ET2<String>.c2(1).id);
  Expect.equals(3, ET2<String>.c3(1, 2).id);
  Expect.equals(4, ET2<String>.c4(3).id);
  Expect.equals(5, ET2<String>.c4(3, 2).id);
  Expect.equals(6, ET2<String>.c5(4).id);
  Expect.equals(7, ET2<String>.c5(4, b: 3).id);
  Expect.equals(8, ET2<String>.c6(5, b: 3).id);
  Expect.equals(0, ET2<String>.f1().id);
  Expect.equals(9, ET2<String>.f2(9).id);
}
