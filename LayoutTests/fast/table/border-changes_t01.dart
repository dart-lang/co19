/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This test checks the behavior of table styles when changing certain table attributes. 
 */
import "dart:html";
import "../../testharness.dart";

void main() {
    
    String yellow = "rgb(255, 255, 0)";
//    String orange = "rgb(255, 165, 0)";
    String red = "rgb(255, 0, 0)";
    
    TableElement table = document.createElement("table") as TableElement;
    table.setAttribute("style", "border-color: $yellow");
    TableRowElement row = table.insertRow(-1);
    row.setAttribute("style", "border-color: orange");
    TableCellElement cell = row.insertCell(-1);
    cell.setAttribute("style", "border-color: $red");
    
    document.body.append(table);
//print("table.getComputedStyle");
    shouldBe(table.getComputedStyle('').borderLeftWidth, "0px");
    shouldBe(table.getComputedStyle('').borderRightWidth, "0px");
    shouldBe(table.getComputedStyle('').borderTopWidth, "0px");
    shouldBe(table.getComputedStyle('').borderBottomWidth, "0px");
    shouldBe(table.getComputedStyle('').borderLeftStyle, "none");
    shouldBe(table.getComputedStyle('').borderRightStyle, "none");
    shouldBe(table.getComputedStyle('').borderTopStyle, "none");
    shouldBe(table.getComputedStyle('').borderBottomStyle, "none");
    shouldBe(table.getComputedStyle('').borderLeftColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderRightColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderTopColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderBottomColor, "$yellow");
    
//print("cell.getComputedStyle");
    shouldBe(cell.getComputedStyle('').borderLeftWidth, "0px");
    shouldBe(cell.getComputedStyle('').borderRightWidth, "0px");
    shouldBe(cell.getComputedStyle('').borderTopWidth, "0px");
    shouldBe(cell.getComputedStyle('').borderBottomWidth, "0px");
    shouldBe(cell.getComputedStyle('').borderLeftStyle, "none");
    shouldBe(cell.getComputedStyle('').borderRightStyle, "none");
    shouldBe(cell.getComputedStyle('').borderTopStyle, "none");
    shouldBe(cell.getComputedStyle('').borderBottomStyle, "none");
    shouldBe(cell.getComputedStyle('').borderLeftColor, "$red");
    shouldBe(cell.getComputedStyle('').borderRightColor, "$red");
    shouldBe(cell.getComputedStyle('').borderTopColor, "$red");
    shouldBe(cell.getComputedStyle('').borderBottomColor, "$red");
    
    table.setAttribute("border", '');
    
//print("border=''");
//print("table.getComputedStyle");
    shouldBe(table.getComputedStyle('').borderLeftWidth, "1px");
    shouldBe(table.getComputedStyle('').borderRightWidth, "1px");
    shouldBe(table.getComputedStyle('').borderTopWidth, "1px");
    shouldBe(table.getComputedStyle('').borderBottomWidth, "1px");
    shouldBe(table.getComputedStyle('').borderLeftStyle, "outset");
    shouldBe(table.getComputedStyle('').borderRightStyle, "outset");
    shouldBe(table.getComputedStyle('').borderTopStyle, "outset");
    shouldBe(table.getComputedStyle('').borderBottomStyle, "outset");
    shouldBe(table.getComputedStyle('').borderLeftColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderRightColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderTopColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderBottomColor, "$yellow");
    
//print("cell.getComputedStyle");
    shouldBe(cell.getComputedStyle('').borderLeftWidth, "1px");
    shouldBe(cell.getComputedStyle('').borderRightWidth, "1px");
    shouldBe(cell.getComputedStyle('').borderTopWidth, "1px");
    shouldBe(cell.getComputedStyle('').borderBottomWidth, "1px");
    shouldBe(cell.getComputedStyle('').borderLeftStyle, "inset");
    shouldBe(cell.getComputedStyle('').borderRightStyle, "inset");
    shouldBe(cell.getComputedStyle('').borderTopStyle, "inset");
    shouldBe(cell.getComputedStyle('').borderBottomStyle, "inset");
    shouldBe(cell.getComputedStyle('').borderLeftColor, "$red");
    shouldBe(cell.getComputedStyle('').borderRightColor, "$red");
    shouldBe(cell.getComputedStyle('').borderTopColor, "$red");
    shouldBe(cell.getComputedStyle('').borderBottomColor, "$red");
    
    table.setAttribute("bordercolor", "green");
    
//print("bordercolor='green'");
//print("table.getComputedStyle");
    shouldBe(table.getComputedStyle('').borderLeftWidth, "1px");
    shouldBe(table.getComputedStyle('').borderRightWidth, "1px");
    shouldBe(table.getComputedStyle('').borderTopWidth, "1px");
    shouldBe(table.getComputedStyle('').borderBottomWidth, "1px");
    shouldBe(table.getComputedStyle('').borderLeftStyle, "solid");
    shouldBe(table.getComputedStyle('').borderRightStyle, "solid");
    shouldBe(table.getComputedStyle('').borderTopStyle, "solid");
    shouldBe(table.getComputedStyle('').borderBottomStyle, "solid");
    shouldBe(table.getComputedStyle('').borderLeftColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderRightColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderTopColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderBottomColor, "$yellow");
    
//print("cell.getComputedStyle");
    shouldBe(cell.getComputedStyle('').borderLeftWidth, "1px");
    shouldBe(cell.getComputedStyle('').borderRightWidth, "1px");
    shouldBe(cell.getComputedStyle('').borderTopWidth, "1px");
    shouldBe(cell.getComputedStyle('').borderBottomWidth, "1px");
    shouldBe(cell.getComputedStyle('').borderLeftStyle, "solid");
    shouldBe(cell.getComputedStyle('').borderRightStyle, "solid");
    shouldBe(cell.getComputedStyle('').borderTopStyle, "solid");
    shouldBe(cell.getComputedStyle('').borderBottomStyle, "solid");
    shouldBe(cell.getComputedStyle('').borderLeftColor, "$red");
    shouldBe(cell.getComputedStyle('').borderRightColor, "$red");
    shouldBe(cell.getComputedStyle('').borderTopColor, "$red");
    shouldBe(cell.getComputedStyle('').borderBottomColor, "$red");
    
    table.setAttribute("rules", "cols");
//print("rules='cols'");    
//print("table.getComputedStyle");
    shouldBe(table.getComputedStyle('').borderLeftWidth, "1px");
    shouldBe(table.getComputedStyle('').borderRightWidth, "1px");
    shouldBe(table.getComputedStyle('').borderTopWidth, "1px");
    shouldBe(table.getComputedStyle('').borderBottomWidth, "1px");
    shouldBe(table.getComputedStyle('').borderLeftStyle, "solid");
    shouldBe(table.getComputedStyle('').borderRightStyle, "solid");
    shouldBe(table.getComputedStyle('').borderTopStyle, "solid");
    shouldBe(table.getComputedStyle('').borderBottomStyle, "solid");
    shouldBe(table.getComputedStyle('').borderLeftColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderRightColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderTopColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderBottomColor, "$yellow");
    
//print("cell.getComputedStyle");
    shouldBe(cell.getComputedStyle('').borderLeftWidth, "1px");
    shouldBe(cell.getComputedStyle('').borderRightWidth, "1px");
    shouldBe(cell.getComputedStyle('').borderTopWidth, "0px");
    shouldBe(cell.getComputedStyle('').borderBottomWidth, "0px");
    shouldBe(cell.getComputedStyle('').borderLeftStyle, "solid");
    shouldBe(cell.getComputedStyle('').borderRightStyle, "solid");
    shouldBe(cell.getComputedStyle('').borderTopStyle, "none");
    shouldBe(cell.getComputedStyle('').borderBottomStyle, "none");
    shouldBe(cell.getComputedStyle('').borderLeftColor, "$red");
    shouldBe(cell.getComputedStyle('').borderRightColor, "$red");
    shouldBe(cell.getComputedStyle('').borderTopColor, "$red");
    shouldBe(cell.getComputedStyle('').borderBottomColor, "$red");
    
    table.setAttribute("rules", "rows");
    
//print("rules='rows'");    
//print("table.getComputedStyle");
    shouldBe(table.getComputedStyle('').borderLeftWidth, "1px");
    shouldBe(table.getComputedStyle('').borderRightWidth, "1px");
    shouldBe(table.getComputedStyle('').borderTopWidth, "1px");
    shouldBe(table.getComputedStyle('').borderBottomWidth, "1px");
    shouldBe(table.getComputedStyle('').borderLeftStyle, "solid");
    shouldBe(table.getComputedStyle('').borderRightStyle, "solid");
    shouldBe(table.getComputedStyle('').borderTopStyle, "solid");
    shouldBe(table.getComputedStyle('').borderBottomStyle, "solid");
    shouldBe(table.getComputedStyle('').borderLeftColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderRightColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderTopColor, "$yellow");
    shouldBe(table.getComputedStyle('').borderBottomColor, "$yellow");
    
//print("cell.getComputedStyle");
    shouldBe(cell.getComputedStyle('').borderLeftWidth, "0px");
    shouldBe(cell.getComputedStyle('').borderRightWidth, "0px");
    shouldBe(cell.getComputedStyle('').borderTopWidth, "1px");
    shouldBe(cell.getComputedStyle('').borderBottomWidth, "1px");
    shouldBe(cell.getComputedStyle('').borderLeftStyle, "none");
    shouldBe(cell.getComputedStyle('').borderRightStyle, "none");
    shouldBe(cell.getComputedStyle('').borderTopStyle, "solid");
    shouldBe(cell.getComputedStyle('').borderBottomStyle, "solid");
    shouldBe(cell.getComputedStyle('').borderLeftColor, "$red");
    shouldBe(cell.getComputedStyle('').borderRightColor, "$red");
    shouldBe(cell.getComputedStyle('').borderTopColor, "$red");
    shouldBe(cell.getComputedStyle('').borderBottomColor, "$red");
    
    checkTestFailures();
    
}