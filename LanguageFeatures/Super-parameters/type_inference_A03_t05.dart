// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We infer the type of a parameter declaration, p, of a
/// non-redirecting generative constructor, C, as:
/// ...
/// Otherwise, if the parameter is a super parameter (super.name) the inferred
/// type of the parameter is the associated super-constructor parameter (which
/// must exist, otherwise we’d have a compile-time error).
///
/// @description Check that if the parameter is a super parameter (super.name)
/// the inferred type of the parameter is the associated super-constructor
/// parameter
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=super-parameters

class S<T> {
  var s1;
  S(T x) : s1 = x;
}

class C extends S<num> {
  var i1;
  C(this.i1, super.x);
}

main() {
  C(1, 2);
  C(1, 3.14);
  C(1, "2");
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  C(1, Object());
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
