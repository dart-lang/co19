/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If two or more extensions apply to the same member access, or if a
 * member of the receiver type takes precedence over an extension method, or if
 * the extension is imported with a prefix, then it is possible to force an
 * extension member invocation:
 *
 *   MyList(object).quickSort();
 *
 * @description Check that if several extensions can be applied to the same
 * member access, it's possible to force an extension member invocation
 * @compile-error
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

extension Ext1<T extends int> on List<T> {
  bool get isExt1 => true;
}

extension Ext2<T extends num> on List<T> {
  bool get isExt1 => false;
}

main() {
  List<int> list = <int>[1, 2, 3];

  Expect.isTrue(Ext1(list).isExt1);
  Expect.isTrue(Ext1<int>(list).isExt1);

  Expect.isFalse(Ext2(list).isExt1);
  Expect.isFalse(Ext2<num>(list).isExt1);
  Expect.isFalse(Ext2<int>(list).isExt1);
}
