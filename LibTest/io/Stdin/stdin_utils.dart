/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * Strdin helper library
 * @author sgrekhov@unipro.ru
 */
library stdin_utils;

List<int> toFlatList(List list) {
  List<int> result = [];
  for (int i = 0; i < list.length; i++) {
    if (list[i] is List) {
      result.addAll(toFlatList(list[i]));
    } else {
      result.add(list[i]);
    }
  }
  return result;
}
