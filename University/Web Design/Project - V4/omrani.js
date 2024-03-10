const comments_arr = [];

const display_comments = () => {
    let list = '<ul>';
    comments_arr.forEach(comment => {
        list += `<li>${comment}</li>`;
    })
    list += '</ul>';
    document.getElementById('comment-box').innerHTML = list;
}

document.querySelector('#submit').onclick = function (event) {
    event.preventDefault();
    const content = document.querySelector('textarea').value;
    if (content.length > 0) {
        comments_arr.push(content);
        display_comments();
        document.querySelector('textarea').value = '';
    }
}


document.querySelector('#clear').onclick = function(event){
    event.preventDefault();
     comments_arr.length = 0;
    display_comments();
  }