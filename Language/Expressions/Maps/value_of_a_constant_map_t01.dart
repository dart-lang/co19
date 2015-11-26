/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The value of a constant map literal const <K, V>{k1: e1...kn: en}
 * is an object m whose class implements the built-in class Map < K, V >. The
 * entries of m are ui : vi; i ∈ 1..n, where ui is the value of the
 * compile-time expression ki and vi is the value of the compile-time
 * expression ei. The value of a constant map literal const {k1: e1 ... kn: en}
 * is defined as the value of a constant map literal const
 * <dynamic, dynamic>{k1: e1 ... kn: en}.
 * @description Checks that the value of a constant map literal const
 * <String, V> {k1: e1... kn: en} is an object that implements interface
 * Map<String, V>.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

class S {
  const S();
}

main() {
  Expect.isTrue(const <String, int>{"": 1} is Map<String, int>);
  Expect.isTrue(const <String, String>{"": "string"} is Map<String, String>);
  Expect.isTrue(const <String, bool>{"": true} is Map<String, bool>);
  Expect.isTrue(const <String, S>{"": const S()} is Map<String, S>);
}
