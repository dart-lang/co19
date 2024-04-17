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

mixin M1<T extends A> {}
mixin M2<T extends AAlias> {}

enum E1<T extends A> {
  e1<B>(),
  e2<AAlias>;
}
enum E2<T extends AAlias>{
  e1<B>(),
  e2<AAlias>;
}

class D<T extends A> {}
extension Ext1<T extends A> on D<T> {}
extension Ext2<T extends AAlias> on D<T> {}

class MA1<T extends A> = Object with M1<T>;
class MA2<T extends AAlias> = Object with M2<T>;

main() {
  Expect.equals("C1<B>", C1<B>().name1);
  Expect.equals("C1<B>", C1<B>().name2());
  Expect.equals("C1<A>", C1<AAlias>().name1);
  Expect.equals("C1<A>", C1<AAlias>().name2());
  Expect.equals("C2<B>", C2<B>().name1);
  Expect.equals("C2<B>", C2<B>().name2());
  Expect.equals("C2<A>", C2<AAlias>().name1);
  Expect.equals("C2<A>", C2<AAlias>().name2());

  Expect.equals("M1<B>", MA1<B>().name1);
  Expect.equals("M1<B>", MA1<B>().name2());
  Expect.equals("M1<A>", MA1<AAlias>().name1);
  Expect.equals("M1<A>", MA1<AAlias>().name2());
  Expect.equals("M2<B>", MA2<B>().name1);
  Expect.equals("M2<B>", MA2<B>().name2());
  Expect.equals("M2<A>", MA2<AAlias>().name1);
  Expect.equals("M2<A>", MA2<AAlias>().name2());

  Expect.equals("E1<B>", E1.e1.name1);
  Expect.equals("E1<B>", E1.e1.name2());
  Expect.equals("E1<A>", E1.e2.name1);
  Expect.equals("E1<A>", E1.e2.name2());
  Expect.equals("E2<B>", E2.e1.name1);
  Expect.equals("E2<B>", E2.e1.name2());
  Expect.equals("E2<A>", E2.e2.name1);
  Expect.equals("E2<A>", E2.e2.name2());

  Expect.equals("Ext1<B>", D<B>().name1);
  Expect.equals("Ext1<B>", D<B>().name2());
  Expect.equals("Ext1<A>", D<AAlias>().name1);
  Expect.equals("Ext1<A>", D<AAlias>().name2());
  Expect.equals("Ext2<B>", D<B>().name1);
  Expect.equals("Ext2<B>", D<B>().name2());
  Expect.equals("Ext2<A>", D<AAlias>().name1);
  Expect.equals("Ext2<A>", D<AAlias>().name2());
}
