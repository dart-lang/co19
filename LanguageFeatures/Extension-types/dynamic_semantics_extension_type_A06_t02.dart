// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let R0 be the extension type erasure of V0. At run time, the type
/// V0 has the same representation and semantics as R0. In particular, they
/// behave identically with respect to is, is!, as, and ==, both when V0 and R0
/// are used as types, and when they occur as subterms of another type.
///
/// @description Check that an extension type erasure is not performed
/// statically outside of switch expressions and statements
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type IterableET1<T>(Iterable<T> _) {}
extension type IterableET2<T>(Iterable<T> _) implements Iterable<T> {}
extension type const ConstIterableET1<T>(Iterable<T> _) {}
extension type const ConstIterableET2<T>(Iterable<T> _)
    implements Iterable<T> {}

main() {
  var it1 = IterableET1<int>([1, 2, 3]);
  var it2 = IterableET2<int>([1, 2, 3]);
  const cit1 = ConstIterableET1<int>([1, 2, 3]);
  const cit2 = ConstIterableET2<int>([1, 2, 3]);

  for (var i in it1) {}
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  for (var i in it2) {}

  for (var i in cit1) {}
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  for (var i in cit2) {}
}
