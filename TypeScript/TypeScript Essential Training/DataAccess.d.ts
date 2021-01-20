import Model = require('./model');
import Todo = Model.Todo;
export interface ITodoService {
    add(todo: Todo): Model.Todo;
    delete(todoId: number): void;
    getAll(): Todo[];
    getById(todoId: number): Model.Todo;
}
export declare class TodoService implements ITodoService {
    private todos;
    constructor(todos: Model.Todo[]);
    add(todo: Todo): Todo;
    delete(todoId: number): void;
    getAll(): Todo[];
    getById(todoId: number): Todo;
}
