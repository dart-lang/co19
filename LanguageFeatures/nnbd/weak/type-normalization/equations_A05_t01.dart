// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The NORM relation defines the canonical representative of classes
/// of equivalent types...
/// This is based on the following equations:
///   Null? == Null
///
/// @description Checks that Null? == Null
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
class A<X> {}
class B<X> implements A<X> {}

class C extends B<Null?> implements A<Null> {}

main() {
  new C();
}
