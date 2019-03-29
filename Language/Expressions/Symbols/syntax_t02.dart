/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A symbol literal denotes the name of a declaration in a Dart
 * program.
 * symbolLiteral:
 *   `#' (operator | (identifier (`.' identifier)*))
 * ;
 * A symbol literal #id where id does not begin with an underscore (_) is
 * equivalent to the expression const Symbol(id).
 * A symbol literal #_id evaluates to the object that would be returned by
 * the call mirror.getPrivateSymbol(id) where mirror is an instance of the
 * class LibraryMirror defined in the library dart:mirrors, reflecting the
 * current library.
 * @description Checks that symbol literal of the kind #operator can be used
 * and it is equivalent to corresponding const Symbol object.
 * @author ilya
 */
// SharedOptions=--enable-experiment=triple-shift

import '../../../Utils/expect.dart';

main() {
  Expect.identical(const Symbol('~'), #~);
  Expect.identical(const Symbol('=='), #==);
  Expect.identical(const Symbol('[]'), #[]);
  Expect.identical(const Symbol('[]='), #[]=);

  Expect.identical(const Symbol('*'), #*);
  Expect.identical(const Symbol('/'), #/);
  Expect.identical(const Symbol('%'), #%);
  Expect.identical(const Symbol('~/'), #~/);

  Expect.identical(const Symbol('+'), #+);
  Expect.identical(const Symbol('-'), #-);

  Expect.identical(const Symbol('<<'), #<<);
  Expect.identical(const Symbol('>>'), #>>);

  Expect.identical(const Symbol('>>>'), #>>>);

  Expect.identical(const Symbol('<'), #<);
  Expect.identical(const Symbol('<='), #<=);
  Expect.identical(const Symbol('>'), #>);
  Expect.identical(const Symbol('>='), #>=);

  Expect.identical(const Symbol('&'), #&);
  Expect.identical(const Symbol('^'), #^);
  Expect.identical(const Symbol('|'), #|);
}


