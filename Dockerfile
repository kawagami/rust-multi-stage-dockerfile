# yt 上看到最小的版本 https://youtu.be/TDukU7X9WNw
FROM ekidd/rust-musl-builder:stable AS builder

# 下面這段執行完會在 /app/rust-alpine 建立起 rust 專案並編譯完成
RUN cargo new rust-alpine && cd rust-alpine && cargo build --release

FROM alpine:latest

WORKDIR /app

# 從 builder 的路徑下 copy 編譯完的執行檔到最後 stage 的地方，可控制要放哪
COPY --from=builder /home/rust/src/rust-alpine/target/x86_64-unknown-linux-musl/release/rust-alpine /app/rust-alpine

CMD ["/app/rust-alpine"]