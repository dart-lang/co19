/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class declaration, type alias, or function [G] may be generic,
 * that is, [G] may have formal type parameters declared.
 * @description @description Checks various correct type alias declarations.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../Utils/expect.dart";

class A<T> {
  A(this.val);
  T val;
}

typedef AAlias<T> = A<T>;

main() {
  AAlias a1 = new A(12345);
  Expect.isTrue(a1 is A);
  Expect.isTrue(a1 is AAlias);
  Expect.equals(12345, a1.val);

  AAlias<int> a2 = new A<int>(14);
  Expect.isTrue(a2 is A<int>);
  Expect.isTrue(a2 is AAlias<int>);
  Expect.equals(14, a2.val);

  AAlias<List<num>> a3 = new A<List<num>>([]);
  Expect.isTrue(a3 is A<List<num>>);
  Expect.isTrue(a3 is AAlias<List<num>>);
  Expect.listEquals([], a3.val);

}
