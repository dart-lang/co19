// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If performing inference on a const value of a generic class
/// results in inferred type arguments to the generic class which contain free
/// type variables from an enclosing generic class or method, the free type
/// variables shall be eliminated by taking the least closure of the inferred
/// type with respect to the free type variables.
/// ```
///   class G<T> {
///    void foo() {
///    const List<T> c = <T>[]; // Error
///    const List<T> d = [];    // The list literal is inferred as <Never>[]
///    }
///   }
/// ```
/// @description Check that `const List<T>` variable of a generic class `G<T>`
/// is initialized by `const` literal of type `List<Never>`.
/// @author iarkh@unipro.ru

class G<T> {
  void foo() {
    const List<T> l1 = [null]; // `Null` is not assignable to `Never`
//                      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

    const Object? v2 = 42;
    const List<T> l2 = [v2];
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified

    const dynamic v3 = '';
    const List<T> l3 = [v3];
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified

    const void v4 = '';
    const List<T> l4 = [v4];
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  G().foo();
}
