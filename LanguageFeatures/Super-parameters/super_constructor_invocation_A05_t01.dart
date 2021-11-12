// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Not using inference on the implicit arguments means that we won’t
/// apply implicit coercions, like downcast from dynamic or .call-tear-off if
/// assignment from the declared type of a super parameter to a
/// super-constructor parameter’s type requires it.
/// For example: C(dynamic super.x) : super(); will not be inferred to be
/// C(dynamic super.x) : super(x as int);, it’s just a compile-time error that
/// dynamic is not a subtype of int, just as it is for redirecting
/// factory constructors.
///
/// @description Check that the inference on the implicit arguments is not used
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=super-parameters

class S {
  int x;
  S(this.x);
}

class C extends S {
  C(dynamic super.x);
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C(42);
}
