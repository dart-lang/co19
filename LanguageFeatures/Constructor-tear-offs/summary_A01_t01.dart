// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We allow TypeName.name and TypeName<typeArgs>.name, when not
/// followed by a type argument list or function argument list, as expressions
/// which creates tear-offs of the constructor TypeName.name. The TypeName can
/// refer to a class declaration or to a type alias declaration which aliases a
/// class.
///
/// typedef ListList<T> = List<List<T>>;
/// const filledList = List.filled;  // List<T> Function<T>(int, T)
/// const filledIntList = List<int>.filled;  // List<int> Function(int, int)
/// const filledListList = ListList.filled;  // List<List<T>> Function<T>(int, T)
/// const filledIntListList = ListList<int>.filled;  // List<List<int>> Function(int, int)
///
/// @description Checks an example from the specification
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

typedef ListList<T> = List<List<T>>;

typedef List<T> Func1<T>(int i, T t);
typedef List<int> Func2(int i1, int i2);
typedef List<List<T>> Func3<T>(int i, T t);
typedef List<List<int>> Func4(int i1, int i2);

main() {
  const filledList = List.filled;  // List<T> Function<T>(int, T)
  Expect.isTrue(filledList is Func1);
  const filledIntList = List<int>.filled;  // List<int> Function(int, int)
  Expect.isTrue(filledIntList is Func2);
  const filledListList = ListList.filled;  // List<List<T>> Function<T>(int, T)
  Expect.isTrue(filledListList is Func3);
  const filledIntListList = ListList<int>.filled;  // List<List<int>> Function(int, int)
  Expect.isTrue(filledIntListList is Func4);
}
