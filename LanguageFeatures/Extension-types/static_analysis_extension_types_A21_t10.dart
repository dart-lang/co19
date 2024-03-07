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
/// @description Checks that if an extension type declaration declares a
/// constant constructor then it can be used in a constant expression
/// @author sgrekhov22@gmail.com
/// @issue 53936,53395

import "../../Utils/expect.dart";

extension type const E<T>(Object? id) {
  const E.cast(Object? v) : this(v as T);
}

typedef TypeAlias<T> = T;
extension type const TypeOf<T>(T _) {}

void main() {
  Expect.equals("a", (const E<String>.cast("a")).id);
  Expect.equals("b", (const E<TypeAlias<String>>.cast("b")).id);
  Expect.equals("c", (const E<TypeOf<String>>.cast("c")).id);
  Expect.equals("d", (const E<String>.cast(TypeOf<String>("d"))).id);
  Expect.equals("e", (const E<TypeOf<String>>.cast(TypeOf<String>("e"))).id);
}
