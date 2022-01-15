#[macro_use]
extern crate log;

use actix_files::Files;
use actix_web::{App, HttpServer};
use log::info;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    const PORT: u16 = 8080;
    let result =
        HttpServer::new(|| App::new().service(Files::new("/", "./static/").prefer_utf8(true)))
            .bind(("127.0.0.1", PORT))?
            .run();
    env_logger::init();
    info!("Listening on 127.0.0.1:{}", PORT);
    result.await
}
