/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error for a class with a const constructor to have a late
 * final instance variable.
 *
 * @description Check that it is an error for a class with a const constructor
 * to have a late final field.
 * @author sgrekhov@unipro.ru
 * @issue 39681
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class C {
  late final int i = 42;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const C();
}

main()  {
  C();
}
