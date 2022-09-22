// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record object has a primitive == operator if all of its field
/// have primitive == operators.
///
/// Note that this is a dynamic property of a record object, not a property of
/// its static type. Since primitive equality only comes into play in constants,
/// the compiler can see the actual field values for a relevant record at
/// compile time because it has the actual constant record value with all of its
/// constant fields. This means a record can be used in a constant set or as a
/// constant map key, but only when its field values could be as well.
///
/// @description Checks that if any of the record's fields has no primitive ==
/// operator then it is a compile-time error to use it as a key in a constant
/// map literal
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

class C {
  const C();

  bool operator ==(Object other) {
    return false;
  }
}

main() {
  const m1 = {
    const (1, "2", String, C(), Object(), Symbol('foo')) : 1
//        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  const m2 = {
    (1, "2", String, const C(), const Object(), const Symbol('foo')): 2
//  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  const m3 = {
    const (one: 1, two: "2", three: String, four: C(), five: Object(), six: Symbol('foo')): 3
//        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  const m4 = {
    (one: 1, two: "2", three: String, four: const C(), five: const Object(), six: const Symbol('foo')): 4
//  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  };
  const m5 = {
    const (1, two: "2", String, four: C(), five: Object(), Symbol('foo')): 5
//        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  const m6 = {
    (1, two: "2", String, const C(), five: const Object(), const Symbol('foo')): 6
//  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
