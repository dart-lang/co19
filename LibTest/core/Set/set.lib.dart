/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author sgrekhov@unipro.ru
 */
library set_library;

Set create([Iterable content]) {
  if (content == null) {
    return new Set();
  }
  return new Set.from(content);
}
