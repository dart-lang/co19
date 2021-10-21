// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For each <enumEntry> with name id and index i in the
/// comma-separated list of enum entries, a static constant is added as follows:
///
/// id ↦ static const Name id = Name._$(i, "id"); — equivalent to id().
/// id(args) ↦ static const Name id = Name._$(i, “id”, args); — if Name is not
/// generic
/// id<types>(args) ↦
///   static const Name<types> id = Name<types>._$(i, “id”, args);
/// id.named(args) ↦ static const Name id = Name._$named(i, “id”, args); — if
///   Name is not generic
/// id<types>.named(args) ↦
///   static const Name<types> id = Name<types>._$named(i, “id”, args);
///
/// @description Check that it is a compile time error if member is called with
/// a wrong type
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

enum E<T> {
  e1<int>(),
  e2<String>(),
  e3<bool>();

  T foo(T t) => t;
}

main() {
  E.e1.foo("42");
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  E.e2.foo(42);
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  E.e3.foo(42);
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
}
