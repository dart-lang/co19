/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description An excerpt from an early Acid3 test 65: construct a table, 
 * and see if the table is as expected
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  TableElement table = document.createElement('table');
  table.append(document.createElement('tbody'));
  var tr1 = document.createElement('tr');
  table.append(tr1);
  table.append(document.createElement('caption'));
  table.append(document.createElement('thead'));
  // <table><tbody/><tr/><caption/><thead/>
  table.insertBefore(table.firstChild.nextNode, null); // move the <tr/> to the end
  // <table><tbody/><caption/><thead/><tr/>
  table.lastChild.replaceWith(table.firstChild); // move the <tbody/> to the end and remove the <tr>
  // <table><caption/><thead/><tbody/>
  table.tBodies[0].insertRow(0);
  // <table><caption/><thead/><tbody><tr/></tbody>
  shouldBe(table.tBodies[0].rows[0].rowIndex, 0);
  shouldBe(table.tBodies[0].rows[0].sectionRowIndex, 0);
  shouldBe(table.childNodes.length, 3);
  shouldBeNonNull(table.caption);
  shouldBeNonNull(table.tHead);
  shouldBeNull(table.tFoot);
  shouldBe(table.tBodies.length, 1);
  shouldBe(table.rows.length, 1);
  shouldBeNull(tr1.parentNode);
  shouldBe(table.caption, table.createCaption());
  shouldBeNull(table.tFoot);
  shouldBe(table.tHead, table.createTHead());
  shouldBe(table.createTFoot(), table.tFoot);
  // either: <table><caption/><thead/><tbody><tr/></tbody><tfoot/>
  //     or: <table><caption/><thead/><tfoot/><tbody><tr/></tbody>
  table.tHead.append(tr1);
  // either: <table><caption/><thead><tr/></thead><tbody><tr/></tbody><tfoot/>
  //     or: <table><caption/><thead><tr/></thead><tfoot/><tbody><tr/></tbody>
  shouldBe(table.rows[0], table.tHead.firstChild);
  shouldBe(table.rows.length, 2);
  shouldBe(table.rows[1], table.tBodies[0].firstChild);
}

