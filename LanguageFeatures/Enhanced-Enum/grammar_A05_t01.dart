// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the enum declaration contains any
/// generative constructor which is not const.
//
// We can allow omitting the const on constructors since it’s required, so we
// can just assume it’s there. That’s a convenience we can also add at any later
// point.
///
/// @description Check that it is a compile-time error if the enum declaration
/// contains any generative constructor which is not const
/// @author sgrekhov@unipro.ru

enum E {
  e1,
//^
// [cfe] unspecified
  e2,
//^
// [cfe] unspecified
  e3;
//^
// [cfe] unspecified

  E();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  E.e1;
}
