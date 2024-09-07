env \
    RUSTFLAGS='-C instrument-coverage' \
    RUSTDOCFLAGS='-C instrument-coverage -Z unstable-options --persist-doctests doctestbins' \
    LLVM_PROFILE_FILE="$(pwd)/target/cov-files/cargo-test-%p-%9m.profraw" \
    cargo test --verbose --profile release

OBJS=(
    target/release/deps/crate_b-4433bd9b3d5ac2d8
)

D="$(rustc --print sysroot)"/lib/rustlib/x86_64-unknown-linux-gnu/bin

"$D"/llvm-profdata merge -sparse -o $(pwd)/target/profdata $(pwd)/target/cov-files

"$D"/llvm-cov show --format html \
    --output-dir html \
    --ignore-filename-regex=/.cargo/registry \
    --ignore-filename-regex=/rustc/ \
    --instr-profile $(pwd)/target/profdata \
    "${OBJS[@]}" \
    --show-instantiations \
    --show-line-counts-or-regions \
    --Xdemangler="${HOME}"/.cargo/bin/rustfilt

