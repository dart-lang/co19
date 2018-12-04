/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * Stdin helper library
 * @author sgrekhov@unipro.ru
 */
library stdin_utils;

List<T> flattenList<T>(List list) =>
    list.expand((e) => e is List ? e : [e]).cast<T>().toList();
