/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ListBase<E> class
 * Implements ListMixin<E>
 * Abstract implementation of a list.
 * All operations are defined in terms of length, operator[], operator[]= and
 * length=, which need to be implemented.
 * @description Checks that List-specific methods work as specified.
 * @author kaigorodov
 */
import "listbase.lib.dart";
import "../ListMixin/inherited_tests.lib.dart";

main() {
  test(create);  
}
