/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Converter<S, TT> fuse<TT>(Converter<T, TT> other)
 * Fuses this with other.
 *
 * Encoding with the resulting converter is equivalent to converting with this
 * before converting with other.
 * @description Checks that encoding with the resulting converter is equivalent
 * to converting with this before converting with other.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

var symbols = ["\"", "&", "<", ">", "'"];
var escape = ["&quot;", "&amp;", "&lt;", "&gt;", "&#39;"];

main() {
  HtmlEscape thisConverter = new HtmlEscape(HtmlEscapeMode.attribute);
  HtmlEscape otherConverter = new HtmlEscape(HtmlEscapeMode.sqAttribute);
  Converter fused = thisConverter.fuse(otherConverter);

  for (int i = 0; i < symbols.length; i++) {
    Expect.equals(otherConverter.convert(thisConverter.convert(symbols[i])),
        fused.convert(symbols[i]));
  }
}
