/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for the list attribute.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div style="display:none">
        <!-- No list attribute -->
        <input type="text" id="i1">
        <!-- Empty list -->
        <input type="text" id="i2" list="">
        <!-- Non-existent ID -->
        <input type="text" id="i3" list="nonexist">
        <!-- ID confilict -->
        <input type="text" id="i4" list="dl2">
        <!-- supported type -->
        <input type="text" id="text" list="dl1">
        <input type="search" id="search" list="dl1">
        <input type="url" id="url" list="dl1">
        <input type="telephone" id="telephone" list="dl1">
        <input type="email" id="email" list="dl1">
        <input type="datetime" id="datetime" list="dl1">
        <input type="date" id="date" list="dl1">
        <input type="month" id="month" list="dl1">
        <input type="week" id="week" list="dl1">
        <input type="time" id="time" list="dl1">
        <input type="datetime-local" id="datetime-local" list="dl1">
        <input type="number" id="number" list="dl1">
        <input type="range" id="range" list="dl1">
        <input type="color" id="color" list="dl1">
        <!-- Unsupported type -->
        <input type="hidden" id="hidden" list="dl1">
        <input type="password" id="password" list="dl1">
        <input type="checkbox" id="checkbox" list="dl1">
        <input type="radio" id="radio" list="dl1">
        <input type="file" id="file" list="dl1">
        <input type="submit" id="submit" list="dl1">
        <input type="image" id="image" list="dl1">
        <input type="reset" id="reset" list="dl1">
        <input type="button" id="button" list="dl1">
      </div>

      <datalist id="dl1">
       <option>value1</option>
      </datalist>

      <datalist id="dl2" class="former">
       <option>value1</option>
      </datalist>
      <datalist id="dl2" class="latter">
       <option>value1</option>
      </datalist>
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement input = document.getElementById('i1') as InputElement;
  shouldBeNull(input.list);

  input = document.getElementById('i2');
  shouldBeNull(input.list);

  input = document.getElementById('i3');
  shouldBeNull(input.list);

  Element datalist = (document.getElementById('i4') as InputElement).list ;
  shouldBe(datalist.className, "former");

  shouldBe((document.getElementById("text") as InputElement).list, document.getElementById("dl1"));
  shouldBe((document.getElementById("search") as InputElement).list, document.getElementById("dl1"));
  shouldBe((document.getElementById("url") as InputElement).list, document.getElementById("dl1"));
  shouldBe((document.getElementById("telephone") as InputElement).list, document.getElementById("dl1"));
  shouldBe((document.getElementById("email") as InputElement).list, document.getElementById("dl1"));
  shouldBe((document.getElementById("datetime") as InputElement).list, document.getElementById("dl1"));
  shouldBe((document.getElementById("date") as InputElement).list, document.getElementById("dl1"));
  shouldBe((document.getElementById("month") as InputElement).list, document.getElementById("dl1"));
  shouldBe((document.getElementById("week") as InputElement).list, document.getElementById("dl1"));
  shouldBe((document.getElementById("time") as InputElement).list, document.getElementById("dl1"));
  shouldBe((document.getElementById("datetime-local") as InputElement).list, document.getElementById("dl1"));
  shouldBe((document.getElementById("number") as InputElement).list, document.getElementById("dl1"));
  shouldBe((document.getElementById("range") as InputElement).list, document.getElementById("dl1"));
  shouldBe((document.getElementById("color") as InputElement).list, document.getElementById("dl1"));

  shouldBeNull((document.getElementById("hidden") as InputElement).list);
  shouldBeNull((document.getElementById("password") as InputElement).list);
  shouldBeNull((document.getElementById("checkbox") as InputElement).list);
  shouldBeNull((document.getElementById("radio") as InputElement).list);
  shouldBeNull((document.getElementById("file") as InputElement).list);
  shouldBeNull((document.getElementById("submit") as InputElement).list);
  shouldBeNull((document.getElementById("image") as InputElement).list);
  shouldBeNull((document.getElementById("reset") as InputElement).list);
  shouldBeNull((document.getElementById("button") as InputElement).list);
}
