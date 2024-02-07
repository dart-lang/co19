// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// NORM(C<T0, ..., Tn>) = C<R0, ..., Rn> where Ri is NORM(Ti)
///
/// @description Checks that NORM(C<T0, ..., Tn>) = C<R0, ..., Rn> where Ri is
/// NORM(Ti). Test T?? == T?
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak

class T {}
class A<X> {}
class B<X> implements A<C<X?>> {}

class C<X> {}

class Test extends B<T?> implements A<C<T?>> {}

main() {
  new Test();
}
