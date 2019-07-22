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
 * member access, it's possible to force an extension member invocation if a
 * member of the receiver type tis imported with a prefix.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";
import "extension_conflict_resolution_lib.dart" as testlib;

extension MySimpleExt on String {
  bool get isLibraryVersion => false;
}

main() {
  Object aString = "testme";
  Expect.isTrue(testlib.MySimpleExt(aString).isLibraryVersion);
  Expect.isFalse(MySimpleExt(aString).isLibraryVersion);
}
