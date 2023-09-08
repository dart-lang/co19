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
/// @description Checks that an instance field is promotable if all of the
/// conditions above are met. Test the case when library contains a top-level
/// getter with the same name
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inference-update-2

int get _x => 42;

class C<T> {
  final T _x;
  C(this._x);

  void test() {
    if (_x is int) {
      _x.isOdd;
    }
  }
}

main() {
  C<num?> c = C(42);
  if (c._x is int) {
    c._x.isEven;
  }
  c.test();
  _x; // to remove `not used` hint
}
