
let client = new XMLHttpRequest();
client.open('GET', '/static/logic/music.pl');
client.onreadystatechange = () => {
    let session = pl.create();
    session.consult(client.responseText, {
        success: function () {

            session.query("keys(X).", {
                success: function (goal) {
                    session.answer({
                        success: (answer) => console.log(session.format_answer(answer)),
                        error: function (err) { /* Uncaught error */
                            console.error(err.toString())
                        },
                        fail: function () { /* Fail */
                        },
                        limit: function () { /* Limit exceeded */
                        }
                    })
                },
                error: function (err) {
                    console.error(err.toString())
                }
            });
        },
        error: function (err) {
            console.error(err.toString())
        }
    });

}
client.send();


