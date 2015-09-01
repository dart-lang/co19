/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library Exports_A03_t02_lib;

export "show_hide_t02_lib2.dart" show foo, boo, badaboo; // exports only foo and boo
export "show_hide_t02_lib3.dart" show bar, C, badaboo; // exports only bar and C
