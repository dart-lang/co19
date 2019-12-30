/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form e! evaluates e to a value v, throws a
 * runtime error if v is null, and otherwise evaluates to v.
 *
 * @description Check that an expression of the form e! evaluates e to a value
 * v, throws no runtime error if v is not null. Test (true)
 * @author sgrekhov@unipro.ru
 * @static-warning
 * @issue 39723
 */
// SharedOptions=--enable-experiment=non-nullable,extension-methods
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

extension on bool {
  String call(int i) => "Lily was here $i times";
  Object? operator [](int index) => index;
  void set s(int value) {}
  void operator []=(int index, int val) {}
}

main() {
  Expect.equals("Lily was here 2 times", true!(2));  /// static type warning
  Expect.equals(24, true![24]);                      /// static type warning
  true![24] = 24;                                    /// static type warning
  true!.s = 24;                                      /// static type warning
}
