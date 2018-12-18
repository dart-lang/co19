/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 34628 (Analyzer throws compile
 * error whereas dart passes when two depending classes ([B<X extends A<X>>] and
 * [A<X extends B<X>>]) are declared). Checks that it's impossible to declare
 * two classes [B<X extends A<X>>] and [A<X extends B<X>>].
 * @compile-error
 * @author iarkh@unipro.ru
 */
class B<X extends A<X>> {}
class A<X extends B<X>> {}

main() {}