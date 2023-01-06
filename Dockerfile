# yt 上看到最小的版本 https://youtu.be/TDukU7X9WNw
FROM ekidd/rust-musl-builder:stable AS builder

# 下面這段執行完會在 /app/rust-scratch 建立起 rust 專案並編譯完成
RUN cargo new rust-scratch && cd rust-scratch && cargo build --release

FROM scratch

WORKDIR /app

COPY --from=builder /home/rust/src/rust-scratch/target/x86_64-unknown-linux-musl/release/rust-scratch /app/rust-scratch

CMD ["/app/rust-scratch"]