// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Example:
///
///   typedef MyList<T> = List<T>;
///   typedef MyList2<T extends num> = List<T>;
///   void main() {
///     // Instantiated type aliases use the aliased type.
///     print(identical(MyList<int>.filled, MyList2<int>.filled)); // true
///     print(identical(MyList<int>.filled, List<int>.filled)); // true
///     print(identical(MyList2<int>.filled, List<int>.filled)); // true
///     // Non-instantiated type aliases have their own generic function.
///     print(identical(MyList.filled, MyList.filled)); // true
///     print(identical(MyList2.filled, MyList2.filled)); // true
///     print(identical(MyList.filled, MyList2.filled)); // false
///     print(identical(MyList.filled, List.filled)); // false (!)
///   }
///
/// @description Checks example 2 from the Spec
///
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

typedef MyList<T> = List<T>;
typedef MyList2<T extends num> = List<T>;

void main() {
  // Instantiated type aliases use the aliased type.
  Expect.identical(MyList<int>.filled, MyList2<int>.filled);
  Expect.identical(MyList<int>.filled, List<int>.filled);
  Expect.identical(MyList2<int>.filled, List<int>.filled);

  // Non-instantiated type aliases have their own generic function.
  Expect.identical(MyList.filled, MyList.filled);
  Expect.identical(MyList2.filled, MyList2.filled);
  Expect.notEquals(MyList.filled, MyList2.filled);
  Expect.notEquals(MyList2.filled, List.filled);
}
