/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String interpolation allows to insert identifiers (and not any expression)
 * with a prefixed $ or quoting the identifier by ${}. Every '$' in a non-raw string must
 * either be escaped (prefixed with a \), or must be followed by a non-dollar-containing
 * identifier, or an open curly brace.
 * @description Checks that strings containing not escaped $ that is not followed by an
 * identifier are not valid.
 * @compile-error
 * @author pagolubev
 * @reviewer iefremov
 */


main() {
  "ab$cd";
}
