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
/// @description Checks that it is a compile-time error if not a constant is
/// used in an evaluation of a constant expression in an extension type constant
/// constructor
/// @author sgrekhov22@gmail.com

extension type const Num(num id) {
  const Num.add(Num v1, Num v2) : this(v1.id + (v2 as num));
//                                     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const Num.sub(Num v1, Num v2) : this((v1 as num) - v2.id);
//                                                   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  print(Num);
}
