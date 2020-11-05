
const initialState = {
    1: {
        id: 1,
        title: "get a cat",
        body: "cat name MiuMiu",
        done: true
    },
    2: {
        id: 2,
        title: "get a dog",
        body: "dog name whatever",
        done: false
    }
};


const todosReducer = (state = initialState, action) => {
    switch (action.type) {
        default:
            return state;
    }
};

export default todosReducer;