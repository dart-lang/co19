/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart source text is represented as a sequence of Unicode code
 * points.
 * @description Checks that the Russian capital letters are represented as a
 * sequence of Unicode  code points.
 * @author vasya
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  List unicode = ["\u0410", "\u0411", "\u0412", "\u0413", "\u0414", "\u0415",
                  "\u0416", "\u0417", "\u0418", "\u0419", "\u041A", "\u041B",
                  "\u041C", "\u041D", "\u041E", "\u041F", "\u0420", "\u0421",
                  "\u0422", "\u0423", "\u0424", "\u0425", "\u0426", "\u0427",
                  "\u0428", "\u0429", "\u042A", "\u042B", "\u042C", "\u042D",
                  "\u042E", "\u042F", "\u0401"];
  List character = ["А", "Б", "В", "Г", "Д", "Е", "Ж", "З", "И", "Й", "К",
                    "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х",
                    "Ц", "Ч", "Ш", "Щ", "Ъ", "Ы", "Ь", "Э", "Ю", "Я", "Ё"];

  Expect.listEquals(unicode, character);
}
