
export interface Todo {
     id: number;
     name: string;
     state: TodoState;
}

// START: TodoState
export enum TodoState {
     New = 1,
     Active,
     Complete,
     Deleted
}
