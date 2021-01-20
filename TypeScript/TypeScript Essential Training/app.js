"use strict";
//export {};
exports.__esModule = true;
/*
     Covered so far:

     - Default parameters in ES6
     - Template string in ES6
     - let and const in ES6
     - For ... of loops in ES6
     - Lambdas expression in ES6
     - Destructing in ES6
     - Spread operator in ES6 (...)
     - Computed properties in ES6
     - Javascript types (string, number, boolean, null, any, void, array)
     - Adding function overloads
     - Custom types
          - interfaces
          - enums
          - anonymous types
     - Classes in ES6
          - Prototypical inheritance
          - Static properties
          - Accessors
          - Inheriting behavior from a base class
          - Abstract classes
          - Implementing interfaces
     - Generics
     - Modules in ES6
          - Using namespace to encapsulate private members
          - Difference between Internal and External modules
          - Loading internal Module
          - Loading external Module
     - Generating declaration files in TypeScript
     - Debugging TypeScript with source maps
     - Implementing method decorators in TypeScript

*/
/*

var container = document.getElementById('container');

function countdown(initial, final = 0, interval = 1) {

     var current = initial;

     while (current > final) {
          container.innerHTML = current;
          current -= interval;
     }

}

countdown(10, 4);

*/
/*

var container = document.getElementById('container');

var todo = {
     id: 123,
     name: "Pick up drycleaning",
     completed: true
}

container.innerHTML = `
<div todo='${todo.id}'>
     <i class="${ todo.completed ? "": "hidden" }" text-success glyphicon glyphicon-ok"></i>
     <span class="name">${todo.name}</span>
</div>
`;

*/
/*

var container = document.getElementById('container');

for (let x = 0; x <= 5; x++) {
     var counter = x;
}

console.log(counter);

*/
/*

var array = [
     'Pick up drycleaning',
     'Clean Batcave',
     'Save Gotham'
];

for (var value of array) {
     console.log(value);
}

*/
/*

var container = document.getElementById('container');

function Counter(el) {
     this.count = 0;

     el.innerHTML = this.count;

     el.addEventListener('click', () => {
          this.count += 1;
          el.innerHTML = this.count;
     });
}

new Counter(container);

*/
/*

// var array = [123, 'Pick up drycleaning', false];
// var [id, title, completed] = array;

// var a = 1;
// var b = 5;
//
// [a,b] = [b,a]

function getTodo(id) {
     var todo = {
          id: 123,
          title: 'Pick up drycleaning',
          completed: false
     }

     return todo;
}

var { completed: isCompleted, id, title } = getTodo(123);

*/
/*

function calculate(action, ...values) {
     var total = 0;

     for (var value of values) {
          switch (action) {
               case 'add':
                    total += value;
                    break;
               case 'substract':
                    total -= value;
                    break;
          }

     }

     return total;
}

console.log( calculate('add', 2, 3, 4, 5) );

var list = [1, 2, 3];
var toAdd = [4, 5, 6];

list.push(...toAdd);
console.log(list);

*/
/*

const osPrefix = 'os_';

var support = {
     [osPrefix + 'Windows']: isSupported('Windows'),
     [osPrefix + 'iOS']: isSupported('iOS'),
     [osPrefix + 'Android']: isSupported('Android'),
}

function isSupported(os) {
     return Math.random() >= 0.5;
}

*/
/*

var animal = {
     name: 'Fido',
     species: 'Dog',
     age: calculateAge(2010),
     speak: function () {
          console.log('Woof!');
     }
}

function calculateAge(birthYear) {
     return Date.now() - birthYear;
}

function totalLength(x, y) {
     let total = x.length + y.length;
     return total;
}

*/
/*

function totalLength(x: any[], y: string): number {
     var total: number = x.length + y.length;
     return total;
}

*/
/*

function totalLength(x: string, y: string): number
function totalLength(x: any[], y: any[]): number
function totalLength(x: (string | any[]), y: (string | any[]) ): number {

     var total: number = x.length + y.length;

     x.slice(0);

     if (x instanceof Array) {
          x.push('abc');
     }

     if (x instanceof String) {
          x.substr(1);
     }

     return total;
}

*/
/*

interface Todo {
     name: string;
     completed?: boolean;
}

interface ITodoService {
     add(todo: Todo): Todo;
     delete(todoId: number): void;
     getAll(): Todo[];
     getById(todoId: number): Todo;
}

var todo: Todo = {
     name: 'Reading a book'
};

*/
/*

interface jQuery {
     (selector: string): HTMLElement;
     version: number;
}

var $ = <jQuery>function(selector) {
     // Find DOM element
}

$.version = 1.12;

var element = $('#container');

*/
/*

interface Todo {
     name: string;
     completed?: boolean;
}

interface jQuery {
     (selector: (string | any)): jQueryElement;
     fn: any;
     version: number;
}

interface jQueryElement {
     data(name: string): any;
     data(name: string, data: any): jQueryElement;
}

interface jQueryElement {
     todo(): Todo;
     todo(todo: Todo): jQueryElement;
}

$.fn.todo = function(todo?: Todo): Todo {

     if (todo) {
          $(this).data('todo', todo);
     } else {
          return $(this).data('todo');
     }
}

var todo = { name: 'Pick up drycleaning' };
var container = $('#container');
container.data('todo', todo);
var savedTodo = container.data('todo

container.todo(todo);

*/
/*

enum TodoState {
     New = 1,
     Active = 2,
     Complete = 3,
     Delete = 4
}

interface Todo {
     name: string;
     state?: TodoState;
}

var todo: Todo = {
     name: "Pick up drycleaning",
     state: TodoState.New
}

// New = 1     Active = 2     Complete = 3   Deleted = 4

function deleteTodo(todo: Todo) {
     if (todo.state != TodoState.Complete) {
          throw "Can't delete incomplete task!";
     }
}

*/
/*

var todo: { name: string };

// todo = { age: 41 }

function totalLength(x: { length: number }, y: { length: number }): number {
     var total: number = x.length + y.length;
     return total;
}

*/
/*

function TodoService() {
     this.todos = [];
}

TodoService.prototype.getAll = function() {
     return this.todos;
}

var service = new TodoService();
service.getAll();

*/
/*

class TodoService {

     static lastId: number = 0;

     constructor(private todos: Todo[]) {

     }

     add(todo: Todo) {
          var newId = TodoService.getNextId();
     }

     getAll() {

     }

     static getNextId() {
          return TodoService.lastId += 1;
     }
}

enum TodoState {
     New = 1,
     Active = 2,
     Complete = 3,
     Delete = 4
}

interface Todo {
     name: string;
     state?: TodoState;
}

var todo: Todo = {
     name: "Pick up drycleaning",
     state: TodoState.New
}

// New = 1     Active = 2     Complete = 3   Deleted = 4

function deleteTodo(todo: Todo) {
     if (todo.state != TodoState.Complete) {
          throw "Can't delete incomplete task!";
     }
}

*/
/*

interface Todo {
     name: string;
     state: TodoState;
}

var todo = {
     name: "Pick up drycleaning",
     get state() {
          return this._state;
     },
     set state(newState) {

          if (newState == TodoState.Complete) {

               var canBeCompleted =
                    this.state == TodoState.Active ||
                    this.state == TodoState.Deleted;

               if (!canBeCompleted) {
                    throw "Todo must be Active or Deleted in order to be marked Copmleted";
               }

          }

          this._state = newState;
     }
}

*/
/*

enum TodoState {
     New = 1,
     Active,
     Complete,
     Deleted
}

class SmartTodo {
     _state: TodoState;
     name: string;

     get state() {
          return this._state;
     }

     set state(newState) {

          if (newState == TodoState.Complete) {

               var canBeCompleted =
                    this.state == TodoState.Active ||
                    this.state == TodoState.Deleted;

               if (!canBeCompleted) {
                    throw "Todo must be Active or Deleted in order to be marked Copmleted";
               }

          }

          this._state = newState;
     }

     constructor(name: string) {
          this.name = name;
     }


}

var todo = new SmartTodo("Pick up drycleaning");
todo.state = TodoState.Complete;
// todo.state

*/
/*
interface Todo {
     name: string;
     state: TodoState;
}

enum TodoState {
     New = 1,
     Active,
     Complete,
     Deleted
}

abstract class TodoStateChanger {

     constructor (private newState: TodoState) {

     }

     abstract canChangeState(todo: Todo): boolean;

     changeState(todo: Todo): Todo {
          if (this.canChangeState(todo)) {
               todo.state = this.newState;
          }

          return todo;
     }

}

class CompleteTodoStateChanger extends TodoStateChanger {

     constructor() {
          super(TodoState.Complete);
     }

     canChangeState(todo: Todo): boolean {
          return !!todo && (
               todo.state == TodoState.Active ||
               todo.state == TodoState.Deleted
          )
     }

}

*/
/*
function clone<T>(value: T): T {
     let serialized = JSON.stringify(value);
     return JSON.parse(serialized);
}

clone('Hello');

clone(123);

var todo: Todo = {
     id: 1,
     name: 'Pick up drycleaning',
     state: TodoState.Active
}

clone(todo);

clone({ name: 'Jess' });
*/
/*

var array: number[] = [1, 2, 3];
var array2: Array<number> = [1, 2, 3];

class KeyValuePair<TKey, TValue> {

     constructor(
          public key: TKey,
          public value: TValue
     ) {

     }
}

let pair1 = new KeyValuePair<number, string>(1, 'first');
let pair2 = new KeyValuePair<string, Date>('Second', new Date(Date.now()));
let pair3 = new KeyValuePair<number, string>(3, 'Third');

class KeyValuePairPrinter<T, U> {
     constructor(private pair: KeyValuePair<T, U>[]) {

     }

     print() {
          for (let p of this.pairs) {
               console.log(`${p.key}: ${p.value}`)
          }
     }
}

var printer = new KeyValuePairPrinter([pair1, pair3]);
printer.print();

*/
/*

interface IHaveALength {
     length: number;
}

function totalLength<T extends IHaveALength> (x: T, y: T) {
     var total: number = x.length + y.length;
     return total;
}

var length = totalLength('Jess', 'Chadwick');

*/
/*

var jQuery = {
     version: 1.19,
     fn: {}
};

(function defineType() {

     if ($.version < 1.15) {
          throw "Plugin requires jQuery version 1.15+";
     }

     $.fn.myPlugin = function() {
          // my plugin code
     }

})(jQuery)

*/
var model_1 = require("./model");
var DataAccess_1 = require("./DataAccess");
var service = new DataAccess_1.TodoService([]);
service.add({
    id: 1,
    name: 'Pick up drycleaning',
    state: model_1.TodoState.New
});
var todos = service.getAll();
todos.forEach(function (todo) {
    return console.log(todo.name + " [" + model_1.TodoState[todo.state] + "]");
});
