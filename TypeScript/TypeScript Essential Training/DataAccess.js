"use strict";
exports.__esModule = true;
exports.TodoService = void 0;
var _lastId = 0;
function generateTodoId() {
    return _lastId += 1;
}
// interface IIdGeenrator {
//      nextId: number;
// }
var TodoService = /** @class */ (function () {
    function TodoService(todos) {
        this.todos = todos;
    }
    TodoService.prototype.add = function (todo) {
        todo.id = generateTodoId();
        this.todos.push(todo);
        return todo;
    };
    TodoService.prototype["delete"] = function (todoId) {
        var toDelete = this.getById(todoId);
        var deletedIndex = this.todos.indexOf(toDelete);
        this.todos.splice(deletedIndex, 1);
    };
    TodoService.prototype.getAll = function () {
        var clone = JSON.stringify(this.todos);
        return JSON.parse(clone);
    };
    TodoService.prototype.getById = function (todoId) {
        var filtered = this.todos.filter(function (x) { return x.id == todoId; });
        if (filtered.length) {
            return filtered[0];
        }
        return null;
    };
    return TodoService;
}());
exports.TodoService = TodoService;
//
// }
