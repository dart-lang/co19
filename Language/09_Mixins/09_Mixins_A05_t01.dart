/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A mixin may be applied to a superclass, yielding a new class
 * @description Checks that it is a compile-time error when with clause
 * is applied to a class instead of superclass
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class C with d.A {}

main() {
}