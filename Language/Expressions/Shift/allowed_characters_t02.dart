/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Space, tab and line terminators characters are allowed between
 * tokens.
 * @description Checks that different whitespace characters and line terminators
 * are allowed in triple shift expressions.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=triple-shift

main() {
  2 >>> 2;

  2	>>>	2	;

  2
  >>>
  2
  ;
}
