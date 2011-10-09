/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Date(int year, int month, int day)
 * No checks are performed on the input values.
 * @description Try to pass null to constructor.
 * @author akuznecov
 * @runtime-error
 * @needsreview Expected to fail but passes. What error has to be produced?
 * @reviewer pagolubev
 */


main() {
  Date date = new Date(null, null, null);
}
