/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Date(int year, int month, int day)
 * No checks are performed on the input values.
 * @description Try to pass non-int type to the constructor.
 * @dynamic-type-error
 * @author akuznecov
 * @reviewer pagolubev
 */


main() {
  Date date = new Date("1991", "8", "18");
}
