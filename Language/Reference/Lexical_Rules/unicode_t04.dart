/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart source text is represented as a sequence of Unicode code
 * points.
 * @description Checks that the Russian small letters are represented as a
 * sequence of Unicode code points.
 * @author vasya
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  List unicode = ["\u0430", "\u0431", "\u0432", "\u0433", "\u0434", "\u0435",
                  "\u0436", "\u0437", "\u0438", "\u0439", "\u043A", "\u043B",
                  "\u043C", "\u043D", "\u043E", "\u043F", "\u0440", "\u0441",
                  "\u0442", "\u0443", "\u0444", "\u0445", "\u0446", "\u0447",
                  "\u0448", "\u0449", "\u044A", "\u044B", "\u044C", "\u044D",
                  "\u044E", "\u044F", "\u0451"];

  List character = ["а", "б", "в", "г", "д", "е", "ж", "з", "и", "й", "к",
                    "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х",
                    "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я", "ё"];

  Expect.listEquals(unicode, character);
}
