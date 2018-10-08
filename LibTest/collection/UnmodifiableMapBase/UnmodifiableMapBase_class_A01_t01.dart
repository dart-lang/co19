/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * Basic implementation of an unmodifiable [Map].
 * This class has a basic implementation of all but two of the members of an
 * umodifiable [Map]. A simple unmodifiable [Map] class can be implemented by
 * extending this class and implementing [keys] and operator[].
 * @description Implementation of [simple UnmodifiableMapBase]
 * @description Checks that unmodifiable map base is created.
 * @author iarkh@unipro.ru
 */
import "unmodifiablemapbase.lib.dart";

main() {
  new UnmodifiableMapBaseImpl({1 : 1, 2 : 23, 37 : 49});
  new UnmodifiableMapBaseImpl({});
}
