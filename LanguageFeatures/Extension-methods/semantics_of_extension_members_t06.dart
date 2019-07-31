/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unqualified identifier lexically resolves to an extension
 * method of the surrounding extension, then that identifier is not equivalent
 * to this.id, rather the invocation is equivalent to an explicit invocation of
 * that extension method on this (which we already know has a compatible type
 * for the extension): Ext<T1,…,Tn>(this).id, where Ext is the surrounding
 * extension and T1 through Tn are its type parameters, if any. The invocation
 * works whether or not the names of the extension or parameters are actually
 * accessible, it is not a syntactic rewrite.
 *
 * @description Check that extension member resolves to an extension method of
 * the surrounding extension
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";
import "semantics_of_extension_members_lib.dart";

main() {
  List<int> list = [3, 1, 4];
  Expect.isFalse(list.isEven);
  Expect.isTrue(list.isOdd);
}
