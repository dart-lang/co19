/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<String> split (String lines, [int start = 0, int end])
 * Split lines into individual lines.
 * If start and end are provided, only split the contents of
 * lines.substring(start, end). The start and end values must specify a valid
 * sub-range of lines (0 <= start <= end <= lines.length).
 *
 * @description Checks that the start and end values must specify a valid
 * sub-range of lines (0 <= start <= end <= lines.length).
 * @author ngl@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  String lines = """
abc
defg
hijkl
""";
  // start < 0
  try {
    print(LineSplitter.split(lines, -1));
  } on RangeError {}
  // start > lines.length
  try {
    print(LineSplitter.split(lines, 20));
  } on RangeError {}
  // start > end
  try {
    print(LineSplitter.split(lines, 10, 7));
  } on RangeError {}
  // end < 0
  try {
    print(LineSplitter.split(lines, 10, -7));
  } on RangeError {}
  // end > lines.length
  try {
    print(LineSplitter.split(lines, 10, 20));
  } on RangeError {}
  // start < 0, end < 0
  try {
    print(LineSplitter.split(lines, -10, -7));
  } on RangeError {}
  // start > lines.length, end > lines.length
  try {
    print(LineSplitter.split(lines, 20, 25));
  } on RangeError {}

}
