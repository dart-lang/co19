// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance field is promotable if all the following conditions
/// hold:
/// - It refers to a field (not a getter)
/// - The field is private
/// - The field is final
/// - There is no getter with the same name elsewhere in the library
/// - There is no non-final field with the same name elsewhere in the library
/// - There is no implicit noSuchMethod forwarder with the same name elsewhere
///   in the library.
///
/// @description Checks that an instance field is promotable even if it is late
/// @author sgrekhov22@gmail.com
/// @issue 50949

// SharedOptions=--enable-experiment=inference-update-2

class A {
  void foo() {}
}

class C<T extends A> {
  late final T? _x;

  void test(T t) {
    _x = t;
    _x.foo();
  }
}

main() {
  C().test(A());
}
