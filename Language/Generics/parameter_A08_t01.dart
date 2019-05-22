/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type parameter cannot be used as a superclass or superinterface
 * @description Checks that class type parameter cannot be used as a superclass
 * @compile-error
 * @author iarkh@unipro.ru
 */

class A<T> extends T {}

main() {
}
