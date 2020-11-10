export const thunk = function(store) {
    // user will open the page = action
    // action -> middleware(thunk, logger)
    return function(next) { // `next` refers to the next middleware or the root reducer if there is no next middleware
      return function(action) {
        // this is the function that gets invoked and receives the action when calling `store.dispatch`
        if (typeof action === "function") {
          return action(store.dispatch, store.getState);
        }
        return next(action);
      };
    };
  };
  