// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The type parameters of the type augmentation do not match the original
///   type's type parameters. This means there must be the same number of type
///   parameters with the same bounds and names.
///
/// @description Checks that it is not an error if an augmenting type
/// declares the same number of type parameters with the same names and bounds
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
import augment 'augmenting_types_A05_t04_lib.dart';

class A {}
typedef AAlias = A;
class B extends A {}

class C1<T extends A> {}
class C2<T extends AAlias> {}

main() {
  Expect.equals("C1<B>", C1<B>().name1);
  Expect.equals("C1<B>", C1<B>().name2());
  Expect.equals("C1<A>", C1<AAlias>().name1);
  Expect.equals("C1<A>", C1<AAlias>().name2());
  Expect.equals("C2<B>", C2<B>().name1);
  Expect.equals("C2<B>", C2<B>().name2());
  Expect.equals("C2<A>", C2<AAlias>().name1);
  Expect.equals("C2<A>", C2<AAlias>().name2());
}
