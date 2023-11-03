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
/// constant constructor then it can be used in a constant expressions
/// @author sgrekhov22@gmail.com
/// @issue 53935

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type const Num(num id) {
  const Num.add(Num v1, Num v2) : this((v1 as num) + (v2 as num));
  const Num.sub(Num v1, Num v2) : this((v1 as num) - (v2 as num));
  const Num.mul(Num v1, Num v2) : this((v1 as num) * (v2 as num));
}

void main() {
  const n = Num.sub(Num.mul(Num(7), Num(7)), Num(7));
  Expect.equals(42, n.id);
}
