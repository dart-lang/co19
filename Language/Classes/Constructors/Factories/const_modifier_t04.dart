// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that C<X1 extends B1 . . . , Xm extends Bm> is the name
/// and formal type parameters of the enclosing class, const? is const or empty,
/// N is C or C.id0 for some identifier id0, and id is an identifier, then
/// consider a declaration of a redirecting factory constructor k of one of the
/// forms
/// const? factory
///     N(T1 x1 . . . , Tn xn, [Tn+1 xn+1=d1, . . . , Tn+k xn+k=dk]) = R;
/// const? factory
///     N(T1 x1 . . . , Tn xn, {Tn+1 xn+1=d1, . . . , Tn+k xn+k=dk}) = R;
/// where R is of one of the forms T<S1 . . . , Sp> or T<S1 . . . , Sp>.id.
/// ...
/// The redirectee constructor for this declaration is the constructor k′
/// denoted by R.
/// ...
/// It is a compile-time error if k is prefixed with the const modifier but k'
/// is not a constant constructor.
///
/// @description Checks that it is not an error if a const redirecting
/// factory constructor redirects to a const factory constructor. Test extension
/// types
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class F {
  const F();
  const factory F.test(F _) = FET;
}

extension type const FET(F _) implements F {}

enum E {
  e1, e2;

  const E();
  const factory E.test(E _) = EET;
}

extension type const EET(E _) implements E {}

main() {
  const f1 = FET(F());
  const f = F.test(F());
  Expect.identical(f, f1);

  const e1 = EET(E.e1);
  const e = E.test(E.e1);
  Expect.identical(e, e1);
}
