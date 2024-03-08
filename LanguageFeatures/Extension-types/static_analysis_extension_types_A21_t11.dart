// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a compile-time error if a constructor doesn't
/// initialize a representation variable
/// @author sgrekhov22@gmail.com

extension type ET1(Object? _) {
  ET1.named(Object? _);
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET2(Object? id) {
  ET2.named(Object? id) {}
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(Object? id) {
  const ET3.named(Object? _);
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET4(Object? _) {
  const ET4.named(Object? id);
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET5(Object? id) {
  ET5.named(Object? id) {
//^^^
// [analyzer] unspecified
// [cfe] unspecified
    this.id = id;
//       ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
}
