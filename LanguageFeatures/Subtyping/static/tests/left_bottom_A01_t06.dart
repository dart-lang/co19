/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Bottom: if T0 is Never then T0 <: T1
 * @description Check that Never isn't a valid super-bounded type argument. Test
 * type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases

class C<X extends C<X>> {}
typedef Neverland = Never;

main() {
  C<Neverland> c = C <Never>();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
