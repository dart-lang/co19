/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library Exports_A03_t01_lib;

export "show_hide_t01_lib2.dart" show foo, bar, boo, badaboo hide bar hide C show foo, boo, badaboo; // exports only foo and boo
export "show_hide_t01_lib3.dart" hide foo, boo show foo, bar, badaboo, C show bar, C, badaboo; // exports only bar and C
