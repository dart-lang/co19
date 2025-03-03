// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The NORM relation defines the canonical representative of classes
/// of equivalent types...
/// This is based on the following equations:
///   X extend Never == Never
///
/// @description Checks that X extend Never == Never
/// @author sgrekhov@unipro.ru

class A<X> {}
class B<X extends Never> implements A<X> {}

class C extends B<Never> implements A<Never> {}

main() {
  new C();
}
