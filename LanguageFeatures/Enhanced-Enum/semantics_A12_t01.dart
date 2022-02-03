// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the resulting class would have any naming conflicts, or other
/// compile-time errors, the enum declaration is invalid and a compile-time
/// error occurs. Such errors include, but are not limited to:
/// ...
/// Declaring a type parameter on the enum which does not have a valid
/// well-bounded or super-bounded instantiate-to-bounds result and not declaring
/// or inheriting a member with base-name values (because the then automatically
/// introduced static const List<EnumName> values requires a valid
/// instantiate-to-bounds result which is at least super-bounded, and a value
/// declaration may require a well-bounded instantiation).
///
/// @description Check that it is not a compile-time error to declare a type
/// parameter on the enum which does have a valid well-bounded result
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

enum E<T extends List> {
  e1<List<int>>(const [42]),
  e2<List<Null>>(const [null]);

  const E(T t);
}

main() {
  E.e1;
}
