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
 * or if you don't want the type argument to the extension to be inferred:
 *
 *   MyList<String>(object).quickSort();
 *
 * or if you imported the extension with a prefix to avoid name collision:
 *
 * prefix.MyList<String>(object).quickSort();
 *
 * The syntax looks like a constructor invocation, but it does not create a new
 * object.
 *
 * If [object.quickSort()] would invoke an extension method of [MyList] if
 * [MyList] was the only extension in scope, then [MyList(object).quickSort()]
 * will invoke the exact same method in the same way.
 *
 * @description Check that if several extensions can be applied to the same
 * member access, it's possible to force an extension member invocation
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
