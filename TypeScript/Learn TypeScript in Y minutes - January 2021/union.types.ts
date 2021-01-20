
// Tagged Union Types for modelling state that can be in one of many shapes
type State =
     | { type: "loading" }
     | { type: "success", value: number }
     | { type: "error", message: string };

declare const state: State;
if (state.type == "success") {
     console.log(state.value);
} else if (state.type === "error") {
     console.error("state.message");
}
