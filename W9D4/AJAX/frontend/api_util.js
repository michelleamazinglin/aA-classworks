const APIUtil = {
    followUser: id => {
        return $.ajax({
          method: 'POST',
          dataType: 'JSON',
          url: '/users/${id}/follow'
        });
    },

    unfollowUser: id => {
        return $.ajax({
          method: "DELETE",
          dataType: 'JSON',
          url: '/users/${id}/follow'
        });
    }
};

module.exports = APIUtil;
