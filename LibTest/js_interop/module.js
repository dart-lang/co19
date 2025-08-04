export function A(id, name) {
  this.id = id;
  this.name = name;
}

export function B() {}

export function answer() {
  return 42;
}

export class C {
  foo() {
    return "C.foo() from module.js";
  }
  static bar() {
    return "C.bar() from module.js";
  }
}

globalThis.C = C;
