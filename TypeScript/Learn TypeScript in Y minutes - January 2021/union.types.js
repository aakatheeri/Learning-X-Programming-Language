if (state.type == "success") {
    console.log(state.value);
}
else if (state.type === "error") {
    console.error("state.message");
}
