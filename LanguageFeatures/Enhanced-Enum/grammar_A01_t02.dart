// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We propose the following to also be allowed:
///
/// enum Name<T> with Mixin1, Mixin2 implements Interface1, Interface2 {
///   id1<int>(args1), id2<String>(args2), id3<bool>(args3);
///   memberDeclaration*
///   const Name(params) : initList;
/// }
/// where memberDeclaration* is any sequence of static and instance member
/// declarations and/or an unnamed generative const constructor declaration.
///
/// The ; after the identifier list is optional if there is nothing else in the
/// declaration, required if there is any member declaration after it. The
/// identifier list may have a trailing comma (like now).
///
/// @description Check that the ; after the identifier list is required if there
/// is any member declaration after it
/// @author sgrekhov@unipro.ru

enum Time1 {
  hour,
  day,
  week

  const Time1();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

enum Time2 {
  hour,
  day,
  week,

  const Time2();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

enum Time3 {
  hour,
//    ^
// [cfe] unspecified
  day,
//   ^
// [cfe] unspecified
  week,
//    ^
// [cfe] unspecified

  factory Time3.f() => values[0];
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  Time1.hour;
  Time2.hour;
  Time3.hour;
}
