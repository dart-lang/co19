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
/// @description Checks that it is a compile-time error if non-redirecting
/// factory extension type constructor is declared as a constant
/// @author sgrekhov22@gmail.com

extension type const ET1(int id) {
  const factory ET1.f(int id) => ET1.new(id);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2<T>(T id) {
  const ET2.n(this.id);
  const factory ET2.f(T id) => ET2.n(id);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  const ET1.f(1);
  const ET2<String>.f("2");
}
